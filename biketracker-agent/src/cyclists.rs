use failure::Error;
use futures::prelude::*;
use reqwest::r#async::{Client, Response};
use serde_derive::Deserialize;
use std::collections::HashMap;

#[derive(Deserialize)]
struct Employee {
    name: String,
}

pub struct Cyclist {
    pub name: String,
}

impl From<Employee> for Cyclist {
    fn from(employee: Employee) -> Self {
        Cyclist {
            name: employee.name,
        }
    }
}

pub fn get_cyclists() -> impl Future<Item = Vec<Cyclist>, Error = Error> {
    Client::new()
        .get("https://raw.githubusercontent.com/Etimo/Etimo/master/employees.json")
        .send()
        .and_then(Response::error_for_status)
        .and_then(|mut res| res.json::<HashMap<String, Employee>>())
        .from_err()
        .map(|employees| {
            employees
                .into_iter()
                .map(|(_username, employee)| employee.into())
                .collect()
        })
}
