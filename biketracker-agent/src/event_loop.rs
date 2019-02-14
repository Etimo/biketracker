// Based on event loop example from https://github.com/PistonDevelopers/conrod/blob/master/examples/support/mod.rs

use futures::prelude::*;
use glium::glutin::{Event, EventsLoop};
use std::time::Duration;
use tokio::timer::{self, Interval};

pub fn event_stream(
    mut events_loop: EventsLoop,
) -> impl Stream<Item = Vec<Event>, Error = timer::Error> {
    let frame_interval = Interval::new_interval(Duration::from_millis(16));
    frame_interval.map(move |_now| {
        let mut events = Vec::new();
        events_loop.poll_events(|event| events.push(event));
        events
    })
}
