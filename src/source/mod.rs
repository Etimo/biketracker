pub mod deskbike;
pub mod fake;

pub use deskbike::Deskbike;
pub use fake::FakeBike;

use failure::Error;

/// A snapshot of the state of the bike.
pub struct BikeMeasurement {
    /// The distance travelled so far in this session, measured in metres.
    cumulative_wheel_meters: Option<f64>,
}

/// A connection to a bike.
pub trait Bike {
    /// Continuously tracks the state of the bike.
    ///
    /// All cumulative values are relative to the state at the time of calling `measurements()`.
    fn measurements<'a>(
        &'a mut self,
    ) -> Result<Box<dyn Iterator<Item = Result<BikeMeasurement, Error>> + 'a>, Error>;
}
