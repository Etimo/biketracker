// Very much based on https://github.com/PistonDevelopers/conrod/blob/master/examples/hello_world.rs

mod source;
mod event_loop;

use conrod::backend::glium::glium::glutin::{ContextBuilder, Event, EventsLoop, WindowBuilder, WindowEvent};
use conrod::backend::glium::glium::glutin::dpi::LogicalSize;
use conrod::backend::glium::glium::texture::Texture2d;
use conrod::backend::glium::glium::{Display, Surface};
use conrod::backend::glium::Renderer;
use conrod::text::Font;
use conrod::{image, widget, widget_ids, UiBuilder, UiCell, Positionable, Widget, Colorable, Labelable, Sizeable};

use event_loop::EventLoop;

use std::process;

widget_ids! {
    struct Ids {
        login_page_header,
        login_page_user_list,
    }
}

// FIXME: Fetch dynamically instead
static CYCLISTS: [&'static str; 3] = [
    "Jens",
    "Erik",
    "Johan",
];

enum Page {
    Login,
    Connecting,
    Cycling,
}

struct State {
    page: Page,
}

impl State {
    fn new() -> State {
        State {
            page: Page::Login,
        }
    }
}

fn render(state: &State, ids: &Ids, ui: &mut UiCell) {
    match state.page {
        Page::Login => {
            widget::Text::new("Who are you?").middle_of(ui.window).color(conrod::color::WHITE).font_size(32).set(ids.login_page_header, ui);
            let (mut items, scrollbar) = widget::List::flow_down(CYCLISTS.len()).h(150.0).scrollbar_next_to().scrollbar_color(conrod::color::WHITE).item_size(30.0).set(ids.login_page_user_list, ui);
            while let Some(item) = items.next(ui) {
                if item.set(widget::Button::new().label(CYCLISTS[item.i]), ui).was_clicked() {
                    println!("{}", CYCLISTS[item.i]);
                }
            }
            if let Some(scrollbar) = scrollbar {
                scrollbar.set(ui);
            }
        },
        Page::Connecting => {
            unreachable!()
        }
        Page::Cycling => {
            unreachable!()
        },
    }
}

fn main() {
    let (width, height) = (320.0, 240.0);

    let mut events_loop = EventsLoop::new();
    let mut event_loop = EventLoop::new();

    let window = WindowBuilder::new()
        .with_title("BikeTracker")
        .with_dimensions(LogicalSize::new(width, height));
    let context = ContextBuilder::new()
        .with_vsync(true)
        .with_multisampling(2);
    let display = Display::new(window, context, &events_loop).unwrap();
    let image_map = image::Map::<Texture2d>::new();
    let mut renderer = Renderer::new(&display).unwrap();

    let mut ui = UiBuilder::new([width as f64, height as f64]).build();
    let ids = Ids::new(ui.widget_id_generator());

    let noto_sans = Font::from_bytes(&include_bytes!(concat!(env!("CARGO_MANIFEST_DIR"), "/NotoSans-Regular.ttf"))[..]).unwrap();
    ui.fonts.insert(noto_sans);

    {
        let mut state = State::new();

        'main: loop {
            for event in event_loop.next(&mut events_loop) {
                match event.clone() {
                    Event::WindowEvent { event, .. } => match event {
                        WindowEvent::CloseRequested => break 'main,
                        _ => {}
                    },
                    _ => {}
                }

                // Use the `winit` backend feature to convert the winit event to a conrod input.
                let input = match conrod::backend::winit::convert_event(event, &display) {
                    None => continue,
                    Some(input) => input,
                };
                ui.handle_event(input);
            }

            let ui = &mut ui.set_widgets();
            // update_channels(&mut state);
            render(&state, &ids, ui);
            // TODO: maybe hook the file I/O into the event loop somehow?

            if let Some(primitives) = ui.draw_if_changed() {
                renderer.fill(&display, primitives, &image_map);
                let mut target = display.draw();
                // target.clear_color(1.0, 1.0, 1.0, 1.0);
                target.clear_color(0.0, 0.0, 0.0, 1.0);
                renderer.draw(&display, &mut target, &image_map).unwrap();
                target.finish().unwrap();
            }
        }
    }

    process::exit(0);
}
