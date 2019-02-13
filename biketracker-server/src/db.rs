use failure::Error;
use futures::prelude::*;
use tokio_postgres::{Client, NoTls};

// type Connection = tokio_postgres::Connection<>

pub fn connect() -> impl Future<Item = Client, Error = Error> {
    // FIXME: Move to config
    tokio_postgres::connect(
        "postgres://biketracker:feKui9Be@localhost/biketracker",
        NoTls,
    )
    .map(|(client, conn)| {
        hyper::rt::spawn(conn.map_err(|err| Err(err).unwrap()));
        client
    })
    .from_err()
}
