mod bike_session;
mod db;

use failure::{format_err, Error, Fail};
use futures::future;
use futures::prelude::*;
use hyper::service::service_fn;
use hyper::{Body, Method, Request, Response, Server, StatusCode};
use serde::Deserialize;

#[derive(Debug, Fail)]
enum ReqError {
    #[fail(display = "Not found")]
    NotFound,
    #[fail(display = "Invalid request: {}", cause)]
    InvalidRequest {
        #[fail(cause)]
        cause: Error,
    },
    #[fail(display = "Internal server error: {}", cause)]
    InternalServerError {
        #[fail(cause)]
        cause: Error,
    },
}

impl ReqError {
    fn internal<E: Into<Error>>(cause: E) -> Self {
        ReqError::InternalServerError {
            cause: cause.into(),
        }
    }
}

fn deserialize_json_body<T: for<'de> Deserialize<'de>>(
    req: Request<Body>,
) -> impl Future<Item = T, Error = ReqError> {
    if req
        .headers()
        .get(hyper::header::CONTENT_TYPE)
        .and_then(|mime| mime.to_str().ok())
        .map_or(false, |mime| mime == "application/json")
    {
        future::Either::A(
            req.into_body()
                .concat2()
                .map_err(ReqError::internal)
                .and_then(|data| {
                    serde_json::from_slice(&data).map_err(|cause| ReqError::InvalidRequest {
                        cause: cause.into(),
                    })
                }),
        )
    } else {
        future::Either::B(future::err(ReqError::InvalidRequest {
            cause: format_err!("This endpoint only accepts JSON responses"),
        }))
    }
}

fn handle_post_bike_session(
    req: Request<Body>,
) -> impl Future<Item = Response<Body>, Error = ReqError> + Send {
    deserialize_json_body::<bike_session::NewBikeSession>(req)
        .and_then(|session| bike_session::add_bike_session(session).map_err(ReqError::internal))
        .and_then(|()| {
            Response::builder()
                .body(Body::from("OK"))
                .map_err(ReqError::internal)
        })
}

fn handle(req: Request<Body>) -> Box<Future<Item = Response<Body>, Error = ReqError> + Send> {
    match (req.method(), req.uri().path()) {
        (&Method::POST, "/bike/session") => Box::new(handle_post_bike_session(req)),
        _ => Box::new(future::err(ReqError::NotFound)),
    }
}

fn main() {
    let addr = ([127, 0, 0, 1], 4000).into();
    let svc = || {
        service_fn(|req| {
            handle(req).or_else(|err| match err {
                ReqError::InternalServerError { cause } => {
                    eprintln!("Internal server error: {}", cause);
                    Response::builder()
                        .status(StatusCode::INTERNAL_SERVER_ERROR)
                        .body(Body::from("Internal server error"))
                }
                ReqError::NotFound => Response::builder()
                    .status(StatusCode::NOT_FOUND)
                    .body(Body::from("Not found")),
                ReqError::InvalidRequest { cause } => Response::builder()
                    .status(StatusCode::BAD_REQUEST)
                    .body(Body::from(format!("Invalid request: {}", cause))),
            })
        })
    };
    let server = Server::bind(&addr).serve(svc).map_err(|err| {
        eprintln!("Server failed: {}", err);
    });
    hyper::rt::run(server);
}
