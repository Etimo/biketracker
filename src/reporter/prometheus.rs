use super::Reporter;

use crate::bike::BikeMeasurement;
use failure::Error;
use futures::prelude::Future;
use std::collections::HashMap;

use prometheus::{core::Collector, Counter};

pub struct PrometheusReporter {
    url: String,
}

impl Reporter for PrometheusReporter {
    fn session_done(
        &mut self,
        final_measurement: &BikeMeasurement,
        username: String,
    ) -> Box<dyn Future<Item = (), Error = Error>> {
        let metric = Counter::new(
            format!("biketracker_meters_cycled[{}]", username),
            "".to_owned(),
        )
        .unwrap();
        metric.inc_by(final_measurement.cumulative_wheel_meters);

        let collectors = vec![Box::new(metric) as Box<dyn Collector>];
        prometheus::push_collector("biketracker", HashMap::new(), &self.url, collectors, None)
            .unwrap();
        unimplemented!()
    }
}
