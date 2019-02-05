use super::{Bike, BikeMeasurement};
use std::thread;
use void::Void;

/// A fake bike providing dummy data.
pub struct FakeBike;

impl FakeBike {
    pub fn new() -> FakeBike {
        FakeBike
    }
}

impl Bike for FakeBike {
    type Measurement = FakeMeasurement;
    type MeasureError = Void;

    fn measurements(&mut self) -> Box<dyn Iterator<Item = Result<FakeMeasurement, Void>>> {
        Box::new(FakeMeasurements::new())
    }
}

#[derive(Clone, Copy, PartialEq)]
pub struct FakeMeasurement {
    meters: f64,
}

impl BikeMeasurement for FakeMeasurement {
    fn cumulative_wheel_meters(&self) -> Option<f64> {
        Some(self.meters)
    }
}

pub struct FakeMeasurements {
    state: FakeMeasurement,
}

impl FakeMeasurements {
    fn new() -> FakeMeasurements {
        FakeMeasurements {
            state: FakeMeasurement { meters: 0.0 },
        }
    }
}

impl Iterator for FakeMeasurements {
    type Item = Result<FakeMeasurement, Void>;

    fn next(&mut self) -> Option<Self::Item> {
        thread::sleep_ms(200);
        self.state.meters += 1.2;
        Some(Ok(self.state))
    }
}
