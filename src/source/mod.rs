pub mod deskbike;

pub trait BikeMeasurement {
    /// The distance travelled so far in this session, measured in metres.
    fn cumulative_wheel_meters(&self) -> Option<f64>;
}

pub trait BikeSession {
    type Measurement: BikeMeasurement;
    type MeasureError;

    fn measurements<'a>(&'a mut self) -> Box<dyn Iterator<Item = Result<Self::Measurement, Self::MeasureError>> + 'a>;
}
