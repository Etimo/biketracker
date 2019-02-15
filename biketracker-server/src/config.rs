use config::{Config, Environment, File, FileFormat};
use failure::Error;
use serde_derive::Deserialize;
use std::net::IpAddr;

#[derive(Deserialize, Clone)]
pub struct ServerConfig {
    pub db: DatabaseConfig,
    pub listen: ListenConfig,
}

impl ServerConfig {
    pub fn load() -> Result<Self, Error> {
        let mut conf = Config::new();
        conf.merge(File::from_str(
            include_str!("../Config.toml"),
            FileFormat::Toml,
        ))?;
        conf.merge(File::with_name("/etc/biketracker-server").required(false))?;
        conf.merge(File::with_name("biketracker-server").required(false))?;
        conf.merge(Environment::with_prefix("biketracker_server"))?;
        conf.try_into().map_err(Error::from)
    }
}

#[derive(Deserialize, Clone)]
pub struct DatabaseConfig {
    pub url: String,
}

#[derive(Deserialize, Clone)]
pub struct ListenConfig {
    pub ip: IpAddr,
    pub port: u16,
}
