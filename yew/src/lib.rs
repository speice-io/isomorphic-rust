extern crate wasm_bindgen;
#[macro_use]
extern crate yew;

use wasm_bindgen::prelude::*;
use yew::prelude::*;

struct Model {}
enum Msg {
}

impl Component for Model {

    type Message = Msg;
    type Properties = ();

    fn create(_: Self::Properties, _: ComponentLink<Self>) -> Self {
        Model {}
    }

    fn update(&mut self, _msg: Self::Message) -> ShouldRender {
        false
    }
}

impl Renderable<Model> for Model {
    fn view(&self) -> Html<Self> {
        html! {
            <p>{ "IT'S ALIVE" }</p>
        }
    }
}

#[wasm_bindgen]
pub fn main() {
    yew::initialize();
    let app: App<Model> = App::new();
    app.mount_to_body();
    yew::run_loop();
}