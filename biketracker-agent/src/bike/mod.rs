pub mod cancelable;
pub mod deskbike;
pub mod fake;

use cancelable::Cancelable;
pub use deskbike::Deskbike;
pub use fake::FakeBike;

use failure::Error;
use futures::prelude::*;
use futures::sync::{mpsc, oneshot};
use std::thread;

/// A snapshot of the state of the bike.
#[derive(Debug, PartialEq, Clone, Copy)]
pub struct BikeMeasurement {
    /// The distance travelled so far in this session, measured in metres.
    pub cumulative_wheel_meters: f64,
}

impl Default for BikeMeasurement {
    fn default() -> Self {
        BikeMeasurement {
            cumulative_wheel_meters: 0.0,
        }
    }
}

/// A connection to a bike.
pub trait Bike {
    /// Continuously tracks the state of the bike.
    ///
    /// All cumulative values are relative to the state at the time of calling `measurements()`.
    fn measurements<'a>(
        &'a mut self,
    ) -> Box<dyn Iterator<Item = Result<BikeMeasurement, Error>> + 'a>;
}

pub type BikeMeasurementStream = Box<dyn Stream<Item = BikeMeasurement, Error = Error>>;

/// Spawns the bike on its own dedicated thread.
pub fn measurements_stream<
    I: Bike,
    F: FnOnce(&mut dyn Cancelable) -> Result<I, Error> + Send + 'static,
>(
    connect: F,
) -> impl Future<Item = BikeMeasurementStream, Error = Error> {
    let (mut connected_write, connected_read) = oneshot::channel::<Result<_, Error>>();
    thread::spawn(move || match connect(&mut connected_write) {
        Ok(mut bike) => {
            let (stream_write, stream_read) = mpsc::channel(0);
            connected_write.send(Ok(stream_read)).unwrap();

            let mut stream_write = stream_write.wait();
            for measurement in bike.measurements() {
                match stream_write.send(measurement) {
                    Ok(()) => {}
                    // Reader closed, terminate
                    Err(_) => break,
                }
            }
        }
        Err(err) => {
            connected_write.send(Err(err)).unwrap();
        }
    });
    connected_read
        .map_err(|err| Error::from_boxed_compat(Box::new(err)))
        .flatten()
        .map(|stream| {
            Box::new(stream.map_err(|()| unreachable!()).and_then(|x| x)) as BikeMeasurementStream
        })
}
