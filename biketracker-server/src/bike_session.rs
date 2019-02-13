use failure::Error;
use futures::prelude::*;
use serde_derive::Deserialize;
// use tokio_postgres::transaction::Transaction;

#[derive(Deserialize)]
pub struct NewBikeSession {
    session_meters: f64,
    username: String,
}

pub fn add_bike_session(session: NewBikeSession) -> impl Future<Item = (), Error = Error> {
    crate::db::connect().and_then(|mut db| {
        db.prepare("INSERT INTO bike_sessions (id, finished_at, session_meters, username) VALUES ($1, $2, $3, $4)")
            .and_then(move |stmt| db.execute(&stmt, &[&uuid::Uuid::new_v4(), &chrono::Utc::now(), &session.session_meters, &session.username]))
            .from_err()
            .map(|_| ())
    })
}
