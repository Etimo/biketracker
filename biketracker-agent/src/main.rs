// Very much based on https://github.com/PistonDevelopers/conrod/blob/master/examples/hello_world.rs

mod config;
mod event_loop;
mod widgets;

use conrod_core::text::Font;
use conrod_core::{
    color, image, widget, widget_ids, Colorable, Labelable, Positionable, Sizeable, UiBuilder,
    UiCell, Widget,
};
use conrod_glium::Renderer;
use glium::glutin::dpi::LogicalSize;
use glium::glutin::{ContextBuilder, Event, EventsLoop, WindowBuilder, WindowEvent};
use glium::texture::Texture2d;
use glium::{Display, Surface};

use event_loop::event_stream;

use futures::prelude::*;
use tokio::runtime::TaskExecutor;

use std::process;

use failure::Error;

use biketracker_agent::bike::{self, measurements_stream, BikeMeasurement, BikeMeasurementStream};
use biketracker_agent::reporter::{self, Reporter};

use self::config::{AgentConfig, BikeConfig, ReporterConfig};

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

widget_ids! {
    struct Ids {
        root_canvas,
        header_canvas,
        app_title_canvas,
        page_title_canvas,
        page_canvas,
        buttonbar_canvas,
        app_title,
        page_title,
        login_page_user_list,
        connect_failed_page_home,
        cycling_page_distance,
        cycling_page_done,
    }
}

// FIXME: Fetch dynamically instead
static CYCLISTS: [&'static str; 23] = [
    "Jens", "Erik", "Johan", "foo", "foo", "foo", "foo", "foo", "foo", "foo", "foo", "foo", "foo",
    "foo", "foo", "foo", "foo", "foo", "foo", "foo", "foo", "foo", "foo",
];

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
    config: AgentConfig,
}

impl State {
    fn new(config: AgentConfig, bg_executor: TaskExecutor) -> State {
        State {
            page: Page::Login,
            reporter: create_reporter(&config.reporter, bg_executor),
            config,
        }
    }
}

fn report_error(state: &mut State, err: Error) {
    println!("{}", err);
    state.page = Page::ConnectFailed { err }
}

fn connect_to_bike(
    config: &BikeConfig,
) -> Box<dyn Future<Item = BikeMeasurementStream, Error = Error>> {
    match config {
        BikeConfig::DeskBike => Box::new(measurements_stream(|| {
            bike::Deskbike::connect().map_err(Error::from)
        })),
        BikeConfig::Fake => Box::new(measurements_stream(|| Ok(bike::FakeBike::default()))),
    }
}

fn create_reporter(config: &ReporterConfig, bg_executor: TaskExecutor) -> Box<dyn Reporter> {
    match config {
        ReporterConfig::Stdout => Box::new(reporter::StdoutReporter::new(bg_executor)),
        ReporterConfig::Server { url } => Box::new(reporter::ServerReporter::new(url.to_owned())),
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

trait PositionableSizeableExt {
    fn fill(self, parent: widget::id::Id) -> Self;
}

impl<W: Positionable + Sizeable> PositionableSizeableExt for W {
    fn fill(self, parent: widget::id::Id) -> Self {
        self.kid_area_wh_of(parent).middle_of(parent)
    }
}

fn render(state: &mut State, ids: &Ids, ui: &mut UiCell) {
    widget::Canvas::new()
        .flow_down(&[
            (
                ids.header_canvas,
                widget::Canvas::new().length(40.0).flow_right(&[
                    (ids.page_title_canvas, widget::Canvas::new()),
                    (ids.app_title_canvas, widget::Canvas::new().length(120.0)),
                ]),
            ),
            (ids.page_canvas, widget::Canvas::new()),
            (ids.buttonbar_canvas, widget::Canvas::new().length(30.0)),
        ])
        .set(ids.root_canvas, ui);

    widget::Text::new("Etimo BikeTracker")
        .fill(ids.app_title_canvas)
        .right_justify()
        .color(color::WHITE)
        .font_size(16)
        .set(ids.app_title, ui);

    match &mut state.page {
        Page::Login => {
            widget::Text::new("Who are you?")
                .fill(ids.page_title_canvas)
                .color(color::WHITE)
                .font_size(32)
                .set(ids.page_title, ui);
            let (mut items, scrollbar) = widgets::ScrollByDrag::new(
                widget::List::flow_down(CYCLISTS.len())
                    .scrollbar_on_top()
                    // .scrollbar_color(color::WHITE)
                    .item_size(30.0),
            )
            // .h(150.0)
            .fill(ids.page_canvas)
            .set(ids.login_page_user_list, ui);
            while let Some(item) = items.next(ui) {
                if item
                    .set(widget::Button::new().label(CYCLISTS[item.i]), ui)
                    .was_clicked()
                {
                    state.page = Page::Connecting {
                        future_bike: connect_to_bike(&state.config.bike),
                        username: CYCLISTS[item.i].to_owned(),
                    };

                    println!("{}", CYCLISTS[item.i]);
                }
            }
            if let Some(scrollbar) = scrollbar {
                scrollbar.set(ui);
            }
        }
        Page::Connecting { .. } => {
            widget::Text::new("Connecting...")
                .fill(ids.page_title_canvas)
                .color(color::WHITE)
                .font_size(32)
                .set(ids.page_title, ui);
        }
        Page::ConnectFailed { err } => {
            widget::Text::new(&format!("Connection failed: {}", err))
                .fill(ids.page_title_canvas)
                .color(color::RED)
                .font_size(32)
                .set(ids.page_title, ui);
            if widget::Button::new()
                .label("Home")
                .fill(ids.buttonbar_canvas)
                .set(ids.connect_failed_page_home, ui)
                .was_clicked()
            {
                state.page = Page::Login;
            }
        }
        Page::Cycling {
            last_measurement,
            username,
            ..
        } => {
            widget::Text::new("Connected!")
                .fill(ids.page_title_canvas)
                .color(color::WHITE)
                .font_size(32)
                .set(ids.page_title, ui);

            widget::Text::new(&format!(
                "Travelled: {:?}m",
                last_measurement.cumulative_wheel_meters
            ))
            .fill(ids.page_canvas)
            .color(color::WHITE)
            .font_size(32)
            .set(ids.cycling_page_distance, ui);

            if widget::Button::new()
                .label("Done")
                .fill(ids.buttonbar_canvas)
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
                .fill(ids.page_title_canvas)
                .color(color::WHITE)
                .font_size(32)
                .set(ids.page_title, ui);
        }
    }
}

fn main() {
    let config = AgentConfig::load().unwrap();

    let (width, height) = (320.0, 240.0);

    let events_loop = EventsLoop::new();

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
    let ids = Ids::new(ui.widget_id_generator());

    let noto_sans = Font::from_bytes(
        &include_bytes!(concat!(env!("CARGO_MANIFEST_DIR"), "/NotoSans-Regular.ttf"))[..],
    )
    .unwrap();
    ui.fonts.insert(noto_sans);

    let bg_runtime = tokio::runtime::Runtime::new().unwrap();

    let mut state = State::new(config, bg_runtime.executor());
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
            // dbg!(ui.global_input().events().collect::<Vec<_>>());
            update(&mut state);
            render(&mut state, &ids, ui);

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
