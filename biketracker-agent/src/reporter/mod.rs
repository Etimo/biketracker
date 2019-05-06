pub mod server;
pub mod stdout;

pub use server::ServerReporter;
pub use stdout::StdoutReporter;

use crate::bike::BikeMeasurement;
use failure::Error;
use futures::prelude::Future;

use biketracker_shared::CreatedBikeSession;

pub trait Reporter {
    fn session_progress(
        &mut self,
        final_measurement: &BikeMeasurement,
        username: String,
        session_id: Option<uuid::Uuid>,
    ) -> Box<dyn Future<Item = CreatedBikeSession, Error = Error>>;
}
