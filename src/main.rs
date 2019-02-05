pub mod source;

use source::{Bike, BikeMeasurement};

fn main() {
    let mut bike = source::deskbike::Deskbike::connect().unwrap();
    for value in bike.measurements().unwrap() {
        dbg!(value.unwrap().cumulative_wheel_meters());
    }
}
