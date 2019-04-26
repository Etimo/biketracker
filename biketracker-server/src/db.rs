use super::config::DatabaseConfig;
use failure::Error;
use futures::future;
use futures::prelude::*;
use openssl::ssl::{SslConnector, SslMethod, SslVerifyMode};
use tokio_postgres::Client;
use tokio_postgres_openssl::MakeTlsConnector;

// type Connection = tokio_postgres::Connection<>

pub fn connect(config: DatabaseConfig) -> impl Future<Item = Client, Error = Error> {
    let tls_connector = SslConnector::builder(SslMethod::tls())
        .map(|mut b| {
            b.set_verify(SslVerifyMode::NONE);
            b.build()
        })
        .map(MakeTlsConnector::new)
        .map_err(Error::from);
    future::result(tls_connector)
        .and_then(move |connector| tokio_postgres::connect(&config.url(), connector).from_err())
        .map(|(client, conn)| {
            hyper::rt::spawn(conn.map_err(|err| Err(err).unwrap()));
            client
        })
}
