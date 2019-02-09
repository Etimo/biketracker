// Very much based on https://github.com/PistonDevelopers/conrod/blob/master/examples/hello_world.rs

mod event_loop;

use conrod::backend::glium::glium::glutin::dpi::LogicalSize;
use conrod::backend::glium::glium::glutin::{
    ContextBuilder, Event, EventsLoop, WindowBuilder, WindowEvent,
};
use conrod::backend::glium::glium::texture::Texture2d;
use conrod::backend::glium::glium::{Display, Surface};
use conrod::backend::glium::Renderer;
use conrod::text::Font;
use conrod::{
    image, widget, widget_ids, Colorable, Labelable, Positionable, Sizeable, UiBuilder, UiCell,
    Widget,
};

use event_loop::event_stream;

use futures::prelude::*;

use std::process;

use failure::Error;

use biketracker::bike::{self, measurements_stream, BikeMeasurement, BikeMeasurementStream};

widget_ids! {
    struct Ids {
        login_page_header,
        login_page_user_list,
        connecting_page_header,
        connect_failed_page_header,
        cycling_page_header,
        cycling_page_distance,
    }
}

// FIXME: Fetch dynamically instead
static CYCLISTS: [&'static str; 3] = ["Jens", "Erik", "Johan"];

enum Page {
    Login,
    Connecting(Box<Future<Item = BikeMeasurementStream, Error = Error>>),
    ConnectFailed(Error),
    Cycling(BikeMeasurementStream, BikeMeasurement),
}

struct State {
    page: Page,
}

impl State {
    fn new() -> State {
        State { page: Page::Login }
    }
}

fn update(state: &mut State) {
    match &mut state.page {
        Page::Login => {}
        Page::Connecting(ref mut connect_handle) => match connect_handle.poll() {
            Ok(Async::Ready(bike)) => state.page = Page::Cycling(bike, BikeMeasurement::default()),
            Ok(Async::NotReady) => {}
            Err(err) => state.page = Page::ConnectFailed(err),
        },
        Page::ConnectFailed(_) => {}
        Page::Cycling(stream, measurement) => {
            match stream.poll() {
                Ok(Async::Ready(Some(new_measurement))) => *measurement = new_measurement,
                // Stream finished
                Ok(Async::Ready(None)) => state.page = Page::Login,
                // No new update
                Ok(Async::NotReady) => {}
                Err(err) => state.page = Page::ConnectFailed(err),
            }
        }
    }
}

fn render(state: &mut State, ids: &Ids, ui: &mut UiCell) {
    match &state.page {
        Page::Login => {
            widget::Text::new("Who are you?")
                .middle_of(ui.window)
                .color(conrod::color::WHITE)
                .font_size(32)
                .set(ids.login_page_header, ui);
            let (mut items, scrollbar) = widget::List::flow_down(CYCLISTS.len())
                .h(150.0)
                .scrollbar_next_to()
                .scrollbar_color(conrod::color::WHITE)
                .item_size(30.0)
                .set(ids.login_page_user_list, ui);
            while let Some(item) = items.next(ui) {
                if item
                    .set(widget::Button::new().label(CYCLISTS[item.i]), ui)
                    .was_clicked()
                {
                    state.page = Page::Connecting(Box::new(measurements_stream(|| {
                        Ok(bike::FakeBike::default())
                    })));
                    // state.page = Page::Connecting(Box::new(measurements_stream(|| {
                    //     source::Deskbike::connect().map_err(Error::from)
                    // })));

                    println!("{}", CYCLISTS[item.i]);
                }
            }
            if let Some(scrollbar) = scrollbar {
                scrollbar.set(ui);
            }
        }
        Page::Connecting(_) => {
            widget::Text::new("Connecting...")
                .middle_of(ui.window)
                .color(conrod::color::WHITE)
                .font_size(32)
                .set(ids.connecting_page_header, ui);
        }
        Page::ConnectFailed(err) => {
            widget::Text::new(&format!("Connection failed: {}", err))
                .middle_of(ui.window)
                .color(conrod::color::RED)
                .font_size(32)
                .set(ids.connect_failed_page_header, ui);
        }
        Page::Cycling(_bike, measurement) => {
            widget::Text::new("Connected!")
                .middle_of(ui.window)
                .color(conrod::color::WHITE)
                .font_size(32)
                .set(ids.cycling_page_header, ui);

            widget::Text::new(&format!(
                "Travelled: {:?}m",
                measurement.cumulative_wheel_meters
            ))
            .color(conrod::color::WHITE)
            .font_size(32)
            .set(ids.cycling_page_distance, ui);
        }
    }
}

fn main() {
    let (width, height) = (320.0, 240.0);

    let events_loop = EventsLoop::new();

    let window = WindowBuilder::new()
        .with_title("BikeTracker")
        .with_dimensions(LogicalSize::new(width, height));
    let context = ContextBuilder::new().with_vsync(true).with_multisampling(2);
    let display = Display::new(window, context, &events_loop).unwrap();
    let image_map = image::Map::<Texture2d>::new();
    let mut renderer = Renderer::new(&display).unwrap();

    let mut ui = UiBuilder::new([width as f64, height as f64]).build();
    let ids = Ids::new(ui.widget_id_generator());

    let noto_sans = Font::from_bytes(
        &include_bytes!(concat!(env!("CARGO_MANIFEST_DIR"), "/NotoSans-Regular.ttf"))[..],
    )
    .unwrap();
    ui.fonts.insert(noto_sans);

    let mut state = State::new();
    let main_loop = event_stream(events_loop)
        .take_while(|events| {
            for event in events.iter() {
                if let Event::WindowEvent {
                    event: WindowEvent::CloseRequested,
                    ..
                } = &event {
                    return Ok(false);
                }
            }
            Ok(true)
        })
        .for_each(move |events| {
            for event in events {
                // Use the `winit` backend feature to convert the winit event to a conrod input.
                if let Some(input) = conrod::backend::winit::convert_event(event, &display) {
                    ui.handle_event(input);
                }
            }

            let ui = &mut ui.set_widgets();
            update(&mut state);
            render(&mut state, &ids, ui);

            if let Some(primitives) = ui.draw_if_changed() {
                renderer.fill(&display, primitives, &image_map);
                let mut target = display.draw();
                // target.clear_color(1.0, 1.0, 1.0, 1.0);
                target.clear_color(0.0, 0.0, 0.0, 1.0);
                renderer.draw(&display, &mut target, &image_map).unwrap();
                target.finish().unwrap();
            }
            Ok(())
        });

    tokio::runtime::current_thread::block_on_all(main_loop).unwrap();
    process::exit(0);
}
