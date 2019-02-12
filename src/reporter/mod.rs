pub mod stdout;

pub use stdout::StdoutReporter;

use crate::bike::BikeMeasurement;
use failure::Error;
use futures::prelude::Future;

pub trait Reporter {
    fn session_done(
        &mut self,
        final_measurement: &BikeMeasurement,
        username: String,
    ) -> Box<dyn Future<Item = (), Error = Error>>;
}
