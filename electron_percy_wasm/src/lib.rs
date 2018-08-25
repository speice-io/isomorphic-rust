    #[macro_use]
    extern crate virtual_dom_rs;

    extern crate percy_webapis;
    extern crate wasm_bindgen;

    use percy_webapis::log;
    use percy_webapis::Element;
    use wasm_bindgen::prelude::*;

    #[wasm_bindgen]
    pub fn main() -> Element {
        log("Entered Rust code");

        let elem = html! {
            <span> {"It is alive!"} </span>
        };

        elem.create_element()
    }