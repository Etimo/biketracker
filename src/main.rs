mod deskbike;

fn main() {
    let mut deskbike_session = deskbike::DeskbikeSession::connect().unwrap();
    for value in deskbike_session.measurements() {
        dbg!(value);
    }
}
