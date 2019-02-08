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

pub struct FakeMeasurements {
    state: BikeMeasurement,
}

impl FakeMeasurements {
    fn new() -> Self {
        FakeMeasurements {
            state: BikeMeasurement { cumulative_wheel_meters: 0.0 },
        }
    }
}

impl Iterator for FakeMeasurements {
    type Item = Result<BikeMeasurement, Error>;

    fn next(&mut self) -> Option<Self::Item> {
        thread::sleep(time::Duration::from_millis(200));
        self.state.cumulative_wheel_meters += 1.2;
        Some(Ok(self.state))
    }
}
