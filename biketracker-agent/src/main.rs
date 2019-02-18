// Very much based on https://github.com/PistonDevelopers/conrod/blob/master/examples/hello_world.rs

mod config;
mod cyclists;
mod event_loop;
mod gui;
mod memo_future;
mod widgets;

use self::config::AgentConfig;
use self::event_loop::event_stream;
use conrod_core::text::Font;
use conrod_core::{image, UiBuilder};
use conrod_glium::Renderer;
use futures::prelude::*;
use glium::glutin::dpi::LogicalSize;
use glium::glutin::{ContextBuilder, Event, EventsLoop, WindowBuilder, WindowEvent};
use glium::texture::Texture2d;
use glium::{Display, Surface};
use std::process;

// Glue between the Glium and Winit backends
// Copied from https://github.com/PistonDevelopers/conrod/blob/1257babfde300d0eb9bbcd67c6e6cbe1d5ccf46a/backends/conrod_glium/examples/support/mod.rs
pub struct GliumDisplayWinitWrapper {
    pub inner: glium::Display,
}
impl conrod_winit::WinitWindow for GliumDisplayWinitWrapper {
    fn get_inner_size(&self) -> Option<(u32, u32)> {
        self.inner.gl_window().get_inner_size().map(Into::into)
    }
    fn hidpi_factor(&self) -> f32 {
        self.inner.gl_window().get_hidpi_factor() as _
    }
}

fn main() {
    let config = AgentConfig::load().unwrap();
    let events_loop = EventsLoop::new();

    let (width, height) = (320.0, 240.0);
    let window = WindowBuilder::new()
        .with_title("BikeTracker")
        .with_dimensions(LogicalSize::new(width, height));
    let context = ContextBuilder::new().with_vsync(true);
    let display = GliumDisplayWinitWrapper {
        inner: Display::new(window, context, &events_loop).unwrap(),
    };
    let image_map = image::Map::<Texture2d>::new();
    let mut renderer = Renderer::new(&display.inner).unwrap();

    let mut ui = UiBuilder::new([width as f64, height as f64]).build();
    let ids = gui::Ids::new(ui.widget_id_generator());

    let noto_sans = Font::from_bytes(
        &include_bytes!(concat!(env!("CARGO_MANIFEST_DIR"), "/NotoSans-Regular.ttf"))[..],
    )
    .unwrap();
    ui.fonts.insert(noto_sans);

    let bg_runtime = tokio::runtime::Runtime::new().unwrap();

    let mut state = gui::State::new(config, bg_runtime.executor());
    let main_loop = event_stream(events_loop)
        .take_while(|events| {
            for event in events.iter() {
                if let Event::WindowEvent {
                    event: WindowEvent::CloseRequested,
                    ..
                } = &event
                {
                    return Ok(false);
                }
            }
            Ok(true)
        })
        .for_each(move |events| {
            for event in events {
                // Use the `winit` backend feature to convert the winit event to a conrod input.
                if let Some(input) = conrod_winit::convert_event(event, &display) {
                    ui.handle_event(input);
                }
            }

            let ui = &mut ui.set_widgets();
            gui::update(&mut state);
            gui::render(&mut state, &ids, ui);

            if let Some(primitives) = ui.draw_if_changed() {
                renderer.fill(&display.inner, primitives, &image_map);
                let mut target = display.inner.draw();
                // target.clear_color(1.0, 1.0, 1.0, 1.0);
                target.clear_color(0.0, 0.0, 0.0, 1.0);
                renderer
                    .draw(&display.inner, &mut target, &image_map)
                    .unwrap();
                target.finish().unwrap();
            }
            Ok(())
        });

    tokio::runtime::current_thread::block_on_all(main_loop).unwrap();
    process::exit(0);
}
