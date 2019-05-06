use super::Reporter;

use crate::bike::BikeMeasurement;
use failure::Error;
use futures::prelude::Future;
use tokio::io::{stdout, write_all};
use tokio::runtime::TaskExecutor;
use biketracker_shared::CreatedBikeSession;

pub struct StdoutReporter {
    // FS operations are only permitted on the multithreaded TaskExecutor,
    // while the front-end (such as a GUI) may be required to use a single-threaded
    // executor for other reasons.
    executor: TaskExecutor,
}

impl StdoutReporter {
    pub fn new(executor: TaskExecutor) -> Self {
        StdoutReporter { executor }
    }
}

impl Reporter for StdoutReporter {
    fn session_progress(
        &mut self,
        final_measurement: &BikeMeasurement,
        username: String,
        session_id: Option<uuid::Uuid>,
    ) -> Box<dyn Future<Item = CreatedBikeSession, Error = Error>> {
        let msg = format!(
            "Session progress: {} cycled {} meters in session {:?}\r\n",
            username, final_measurement.cumulative_wheel_meters, session_id
        );
        Box::new(futures::sync::oneshot::spawn(
            write_all(stdout(), msg.into_bytes()).then(|res| match res {
                Ok(_) => Ok(CreatedBikeSession { id: uuid::Uuid::new_v4() }),
                Err(err) => Err(Error::from_boxed_compat(Box::new(err))),
            }),
            &self.executor,
        ))
    }
}
