use config::{Config, Environment, File, FileFormat};
use failure::Error;
use serde_derive::Deserialize;

#[derive(Deserialize)]
pub struct AgentConfig {
    pub bike: BikeConfig,
    pub reporter: ReporterConfig,
}

impl AgentConfig {
    pub fn load() -> Result<Self, Error> {
        let mut conf = Config::new();
        conf.merge(File::from_str(
            include_str!("../Config.toml"),
            FileFormat::Toml,
        ))?;
        conf.merge(File::with_name("/etc/biketracker-agent").required(false))?;
        conf.merge(File::with_name("biketracker-agent").required(false))?;
        conf.merge(Environment::with_prefix("biketracker_agent"))?;
        conf.try_into().map_err(Error::from)
    }
}

#[derive(Deserialize)]
#[serde(tag = "type")]
pub enum BikeConfig {
    Fake,
    DeskBike,
}

#[derive(Deserialize)]
#[serde(tag = "type")]
pub enum ReporterConfig {
    Stdout,
    Server { url: String },
}
