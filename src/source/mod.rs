pub mod deskbike;
pub mod fake;

pub use deskbike::Deskbike;
pub use fake::FakeBike;

/// A snapshot of the state of the bike.
pub trait BikeMeasurement {
    /// The distance travelled so far in this session, measured in metres.
    fn cumulative_wheel_meters(&self) -> Option<f64>;
}

/// A connection to a bike.
pub trait Bike {
    type Measurement: BikeMeasurement;
    type MeasureError;

    /// Continuously tracks the state of the bike.
    ///
    /// All cumulative values are relative to the state at the time of calling `measurements()`.
    fn measurements<'a>(
        &'a mut self,
    ) -> Box<dyn Iterator<Item = Result<Self::Measurement, Self::MeasureError>> + 'a>;
}
