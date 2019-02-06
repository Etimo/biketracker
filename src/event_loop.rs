// Based on event loop example from https://github.com/PistonDevelopers/conrod/blob/master/examples/support/mod.rs

use conrod::backend::glium::glium::glutin::{Event, EventsLoop};
use std::{
    thread::sleep, time::{Duration, Instant},
};

pub struct EventLoop {
    last_update: Instant,
}

impl EventLoop {
    pub fn new() -> Self {
        EventLoop {
            last_update: Instant::now(),
        }
    }

    /// Produce an iterator yielding all available events.
    pub fn next(&mut self, events_loop: &mut EventsLoop) -> Vec<Event> {
        // We don't want to loop any faster than 60 FPS, so wait until it has been at least 16ms
        // since the last yield.
        let last_update = self.last_update;
        let sixteen_ms = Duration::from_millis(16);
        let duration_since_last_update = Instant::now().duration_since(last_update);
        if duration_since_last_update < sixteen_ms {
            sleep(sixteen_ms - duration_since_last_update);
        }

        // Collect all pending events.
        let mut events = Vec::new();
        events_loop.poll_events(|event| events.push(event));

        self.last_update = Instant::now();

        events
    }
}
