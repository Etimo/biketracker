use super::config::ServerConfig;
use failure::Error;
use futures::prelude::*;
use biketracker_shared::{CreatedBikeSession, NewBikeSession};
// use tokio_postgres::transaction::Transaction;

pub fn add_bike_session(
    session: NewBikeSession,
    config: ServerConfig,
) -> impl Future<Item = CreatedBikeSession, Error = Error> {
    crate::db::connect(config.db.clone()).and_then(|mut db| {
        db.prepare("INSERT INTO bike_sessions (id, finished_at, session_meters, username) VALUES ($1, $2, $3, $4) ON CONFLICT (id) DO UPDATE SET finished_at=$2, session_meters=$3")
            .and_then(move |stmt| {
                let id = session.id.unwrap_or_else(uuid::Uuid::new_v4);
                println!("Saving bike session {:?} with id {:?}", &session, &id);
                db.execute(&stmt, &[&id, &chrono::Utc::now(), &session.session_meters, &session.username])
                    .map(move |_| CreatedBikeSession { id })
            })
            .from_err()
    })
}
