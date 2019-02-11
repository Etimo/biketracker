use super::Reporter;

use crate::bike::BikeMeasurement;
use failure::Error;
use futures::prelude::Future;
use tokio::io::{stdout, write_all};
use tokio::runtime::TaskExecutor;

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
    fn session_done(
        &mut self,
        final_measurement: &BikeMeasurement,
        username: String,
    ) -> Box<dyn Future<Item = (), Error = Error>> {
        let msg = format!(
            "Session finished: {} cycled {} meters\r\n",
            username, final_measurement.cumulative_wheel_meters
        );
        Box::new(futures::sync::oneshot::spawn(
            write_all(stdout(), msg.into_bytes()).then(|res| match res {
                Ok(_) => Ok(()),
                Err(err) => Err(Error::from_boxed_compat(Box::new(err))),
            }),
            &self.executor,
        ))
    }
}
