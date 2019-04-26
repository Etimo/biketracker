use super::config::DatabaseConfig;
use failure::Error;
use futures::prelude::*;
use tokio_postgres::{Client, NoTls};

// type Connection = tokio_postgres::Connection<>

pub fn connect(config: &DatabaseConfig) -> impl Future<Item = Client, Error = Error> {
    // FIXME: Move to config
    tokio_postgres::connect(&config.url(), NoTls)
        .map(|(client, conn)| {
            hyper::rt::spawn(conn.map_err(|err| Err(err).unwrap()));
            client
        })
        .from_err()
}
