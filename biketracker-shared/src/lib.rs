use serde_derive::{Deserialize, Serialize};

#[derive(Deserialize, Serialize, Debug)]
pub struct NewBikeSession {
    pub id: Option<uuid::Uuid>,
    pub session_meters: f64,
    pub username: String,
}

#[derive(Deserialize, Serialize, Debug)]
pub struct CreatedBikeSession {
    pub id: uuid::Uuid,
}
