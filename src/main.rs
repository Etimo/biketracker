mod source;

use source::{BikeSession, BikeMeasurement};

fn main() {
    let mut bike = source::deskbike::DeskbikeSession::connect().unwrap();
    for value in bike.measurements() {
        dbg!(value.unwrap().cumulative_wheel_meters());
    }
}
