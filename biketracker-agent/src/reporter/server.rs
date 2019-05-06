use super::Reporter;

use crate::bike::BikeMeasurement;
use failure::{format_err, Error};
use futures::future;
use futures::prelude::*;
use reqwest::r#async::Client;
use reqwest::StatusCode;
use serde_derive::Serialize;
use biketracker_shared::{NewBikeSession, CreatedBikeSession};

pub struct ServerReporter {
    url: String,
    client: Client,
}

impl ServerReporter {
    pub fn new(url: String) -> Self {
        ServerReporter {
            url,
            client: Client::new(),
        }
    }
}

impl Reporter for ServerReporter {
    fn session_progress(
        &mut self,
        final_measurement: &BikeMeasurement,
        username: String,
        session_id: Option<uuid::Uuid>,
    ) -> Box<dyn Future<Item = CreatedBikeSession, Error = Error>> {
        Box::new(
            self.client
                .post(&format!("{}/bike/session", self.url))
                .json(&NewBikeSession {
                    id: session_id,
                    session_meters: final_measurement.cumulative_wheel_meters,
                    username,
                })
                .send()
                .from_err()
                .and_then(|mut res| {
                    if res.status() == StatusCode::OK {
                        future::Either::A(res.json().from_err())
                    } else {
                        let url = res.url().clone();
                        let status = res.status().clone();
                        future::Either::B(res.into_body().concat2().from_err().and_then(
                            move |body| {
                                Err(format_err!(
                                    "Request to {} failed with status {}: {:?}",
                                    url,
                                    status,
                                    body
                                ))
                            },
                        ))
                    }
                }),
        )
    }
}
