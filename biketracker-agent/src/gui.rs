use super::config::{AgentConfig, BikeConfig, ReporterConfig};
use super::cyclists::{get_cyclists, Cyclist};
use super::memo_future::{MemoFuture, RetryFuture};
use super::widgets;
use biketracker_agent::bike::{self, measurements_stream, BikeMeasurement, BikeMeasurementStream};
use biketracker_agent::reporter::{self, Reporter};
use conrod_core::{
    color, widget, widget_ids, Colorable, Labelable, Positionable, Sizeable, UiCell, Widget,
};
use failure::Error;
use futures::prelude::*;
use std::rc::Rc;
use tokio::runtime::TaskExecutor;

widget_ids! {
    pub struct Ids {
        root_canvas,
        header_canvas,
        app_title_canvas,
        page_title_canvas,
        page_canvas,
        buttonbar_canvas,
        app_title,
        page_title,
        login_page_user_list,
        login_page_user_list_loading,
        connecting_page_home,
        failed_page_details,
        failed_page_home,
        cycling_page_distance,
        cycling_page_done,
    }
}

pub struct State {
    page: Page,
    reporter: Box<dyn Reporter>,
    config: AgentConfig,
    cyclists: Box<dyn Future<Item = Rc<Vec<Cyclist>>, Error = Rc<Error>>>,
}

enum Page {
    Login,
    Connecting {
        future_bike: Box<dyn Future<Item = BikeMeasurementStream, Error = Error>>,
        username: String,
    },
    Failed {
        err: Rc<Error>,
    },
    Cycling {
        bike: BikeMeasurementStream,
        last_measurement: BikeMeasurement,
        username: String,
    },
    Reporting(Box<dyn Future<Item = (), Error = Error>>),
}

impl State {
    pub fn new(config: AgentConfig, bg_executor: TaskExecutor) -> State {
        State {
            page: Page::Login,
            reporter: create_reporter(&config.reporter, bg_executor),
            config,
            cyclists: Box::new(RetryFuture::new(|| MemoFuture::new(get_cyclists()))),
        }
    }
}

fn report_error(state: &mut State, err: Error) {
    report_error_rc(state, Rc::new(err))
}
fn report_error_rc(state: &mut State, err: Rc<Error>) {
    eprintln!("Failed: {}\n{:?}", err, err);
    state.page = Page::Failed { err }
}

fn connect_to_bike(
    config: &BikeConfig,
) -> Box<dyn Future<Item = BikeMeasurementStream, Error = Error>> {
    match config {
        BikeConfig::DeskBike => Box::new(measurements_stream(|canceled| {
            bike::Deskbike::connect_or_cancel(canceled).map_err(Error::from)
        })),
        BikeConfig::Fake => Box::new(measurements_stream(|_canceled| {
            Ok(bike::FakeBike::default())
        })),
    }
}

fn create_reporter(config: &ReporterConfig, bg_executor: TaskExecutor) -> Box<dyn Reporter> {
    match config {
        ReporterConfig::Stdout => Box::new(reporter::StdoutReporter::new(bg_executor)),
        ReporterConfig::Server { url } => Box::new(reporter::ServerReporter::new(url.to_owned())),
    }
}

pub fn update(state: &mut State) {
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
        Page::Failed { .. } => {}
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

pub fn render(state: &mut State, ids: &Ids, ui: &mut UiCell) {
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
            match state.cyclists.poll() {
                Ok(Async::Ready(cyclists)) => {
                    let (mut items, scrollbar) = widgets::ScrollByDrag::new(
                        widget::List::flow_down(cyclists.len())
                            .scrollbar_on_top()
                            .item_size(30.0),
                    )
                    .fill(ids.page_canvas)
                    .set(ids.login_page_user_list, ui);
                    while let Some(item) = items.next(ui) {
                        if item
                            .set(widget::Button::new().label(&cyclists[item.i].name), ui)
                            .was_clicked()
                        {
                            state.page = Page::Connecting {
                                future_bike: connect_to_bike(&state.config.bike),
                                username: cyclists[item.i].name.to_owned(),
                            };
                        }
                    }
                    if let Some(scrollbar) = scrollbar {
                        scrollbar.set(ui);
                    }
                }
                Ok(Async::NotReady) => widget::Text::new("Loading cyclists...")
                    .color(color::WHITE)
                    .fill(ids.page_canvas)
                    .set(ids.login_page_user_list_loading, ui),
                Err(err) => report_error_rc(state, err),
            }
        }
        Page::Connecting { .. } => {
            widget::Text::new("Connecting...")
                .fill(ids.page_title_canvas)
                .color(color::WHITE)
                .font_size(32)
                .set(ids.page_title, ui);
            if widget::Button::new()
                .label("Cancel")
                .fill(ids.buttonbar_canvas)
                .set(ids.connecting_page_home, ui)
                .was_clicked()
            {
                state.page = Page::Login;
            }
        }
        Page::Failed { err } => {
            widget::Text::new("Error")
                .fill(ids.page_title_canvas)
                .color(color::RED)
                .font_size(32)
                .set(ids.page_title, ui);
            widget::Text::new(&format!("{}", err))
                .fill(ids.page_canvas)
                .color(color::WHITE)
                .font_size(32)
                .set(ids.failed_page_details, ui);
            if widget::Button::new()
                .label("Home")
                .fill(ids.buttonbar_canvas)
                .set(ids.failed_page_home, ui)
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
