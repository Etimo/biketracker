use super::{Bike, BikeMeasurement};
use failure::Error;
use std::{thread, time};

/// A fake bike providing dummy data.
pub struct FakeBike;

impl FakeBike {
    pub fn new() -> FakeBike {
        thread::sleep(time::Duration::from_millis(500));
        FakeBike
    }
}

impl Bike for FakeBike {
    fn measurements(&mut self) -> Box<dyn Iterator<Item = Result<BikeMeasurement, Error>>> {
        Box::new(FakeMeasurements::new())
    }
}

#[derive(Clone, Copy, PartialEq)]
pub struct FakeMeasurement {
    meters: f64,
}

impl From<FakeMeasurement> for BikeMeasurement {
    fn from(fake: FakeMeasurement) -> Self {
        BikeMeasurement {
            cumulative_wheel_meters: Some(fake.meters),
        }
    }
}

pub struct FakeMeasurements {
    state: FakeMeasurement,
}

impl FakeMeasurements {
    fn new() -> Self {
        FakeMeasurements {
            state: FakeMeasurement { meters: 0.0 },
        }
    }
}

impl Iterator for FakeMeasurements {
    type Item = Result<BikeMeasurement, Error>;

    fn next(&mut self) -> Option<Self::Item> {
        thread::sleep(time::Duration::from_millis(200));
        self.state.meters += 1.2;
        Some(Ok(self.state.into()))
    }
}
