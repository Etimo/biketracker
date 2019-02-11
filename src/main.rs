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
use tokio::runtime::TaskExecutor;

use std::process;

use failure::Error;

use biketracker::bike::{self, measurements_stream, BikeMeasurement, BikeMeasurementStream};
use biketracker::reporter::{self, Reporter};

widget_ids! {
    struct Ids {
        login_page_header,
        login_page_user_list,
        connecting_page_header,
        connect_failed_page_header,
        cycling_page_header,
        cycling_page_distance,
        cycling_page_done,
        reporting_page_header,
    }
}

// FIXME: Fetch dynamically instead
static CYCLISTS: [&'static str; 3] = ["Jens", "Erik", "Johan"];

enum Page {
    Login,
    Connecting {
        future_bike: Box<dyn Future<Item = BikeMeasurementStream, Error = Error>>,
        username: String,
    },
    ConnectFailed {
        err: Error,
    },
    Cycling {
        bike: BikeMeasurementStream,
        last_measurement: BikeMeasurement,
        username: String,
    },
    Reporting(Box<dyn Future<Item = (), Error = Error>>),
}

struct State {
    page: Page,
    reporter: Box<dyn Reporter>,
}

impl State {
    fn new(bg_executor: TaskExecutor) -> State {
        State {
            page: Page::Login,
            reporter: Box::new(reporter::StdoutReporter::new(bg_executor)),
        }
    }
}

fn report_error(state: &mut State, err: Error) {
    println!("{}", err);
    state.page = Page::ConnectFailed {
        err,
    }
}

fn update(state: &mut State) {
    match &mut state.page {
        Page::Login => {}
        Page::Connecting {
            future_bike,
            username,
        } => match future_bike.poll() {
            Ok(Async::Ready(bike)) => {
                state.page = Page::Cycling {
                    bike,
                    last_measurement: BikeMeasurement::default(),
                    username: username.clone(),
                }
            }
            Ok(Async::NotReady) => {}
            Err(err) => {
                report_error(state, err);
            }
        },
        Page::ConnectFailed { .. } => {}
        Page::Cycling {
            bike,
            last_measurement,
            username,
        } => {
            match bike.poll() {
                Ok(Async::Ready(Some(new_measurement))) => *last_measurement = new_measurement,
                // Stream finished
                Ok(Async::Ready(None)) => {
                    state.page = Page::Reporting(
                        state
                            .reporter
                            .session_done(last_measurement, username.clone()),
                    )
                }
                // No new update
                Ok(Async::NotReady) => {}
                Err(err) => {
                    report_error(state, err);
                }
            }
        }
        Page::Reporting(report) => match report.poll() {
            Ok(Async::Ready(_)) => state.page = Page::Login,
            Ok(Async::NotReady) => {}
            Err(err) => {
                report_error(state, err);
            }
        },
    }
}

fn render(state: &mut State, ids: &Ids, ui: &mut UiCell) {
    match &mut state.page {
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
                    state.page = Page::Connecting {
                        future_bike: Box::new(measurements_stream(
                            || Ok(bike::FakeBike::default()),
                        )),
                        username: CYCLISTS[item.i].to_owned(),
                    };
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
        Page::Connecting { .. } => {
            widget::Text::new("Connecting...")
                .middle_of(ui.window)
                .color(conrod::color::WHITE)
                .font_size(32)
                .set(ids.connecting_page_header, ui);
        }
        Page::ConnectFailed { err } => {
            widget::Text::new(&format!("Connection failed: {}", err))
                .middle_of(ui.window)
                .color(conrod::color::RED)
                .font_size(32)
                .set(ids.connect_failed_page_header, ui);
        }
        Page::Cycling {
            last_measurement,
            username,
            ..
        } => {
            widget::Text::new("Connected!")
                .middle_of(ui.window)
                .color(conrod::color::WHITE)
                .font_size(32)
                .set(ids.cycling_page_header, ui);

            widget::Text::new(&format!(
                "Travelled: {:?}m",
                last_measurement.cumulative_wheel_meters
            ))
            .color(conrod::color::WHITE)
            .font_size(32)
            .set(ids.cycling_page_distance, ui);

            if widget::Button::new()
                .label("Done")
                .set(ids.cycling_page_done, ui)
                .was_clicked()
            {
                state.page = Page::Reporting(
                    state
                        .reporter
                        .session_done(last_measurement, username.clone()),
                );
            }
        }
        Page::Reporting(_) => {
            widget::Text::new("Uploading report...")
                .middle_of(ui.window)
                .color(conrod::color::WHITE)
                .font_size(32)
                .set(ids.reporting_page_header, ui);
        }
    }
}

fn main() {
    let (width, height) = (320.0, 240.0);

    let events_loop = EventsLoop::new();

    let window = WindowBuilder::new()
        .with_title("BikeTracker")
        .with_dimensions(LogicalSize::new(width, height));
    let context = ContextBuilder::new().with_vsync(true);
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

    let bg_runtime = tokio::runtime::Runtime::new().unwrap();

    let mut state = State::new(bg_runtime.executor());
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
