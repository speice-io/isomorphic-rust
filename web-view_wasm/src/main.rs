#[macro_use]
extern crate lazy_static;
#[macro_use]
extern crate virtual_dom_rs;

extern crate percy_webapis;
extern crate web_view;

use percy_webapis::log;
use web_view::*;

lazy_static! {
    // I'm not sure how to actually embed this payload.
    static ref WASM: &'static [u8] = include_bytes!("app.wasm");
    static ref WASM_STR: String = String::from_utf8(WASM.to_vec()).unwrap();
    static ref JS: String = format!(r#"
    var wasm = "{}";
    var enc = new TextEncoder();
    var arr = enc.encode(wasm);
    "#, WASM_STR.clone());
}

fn main() {
    let size = (800, 600);
    let resizable = true;
    let debug = true;

    let html = format!("<html><body></body><script>{}</script></html>", JS.clone());

    run("wasm example", Content::Html(html), Some(size), resizable, debug,
        move |webview| {},
        move |webview, arg, userdata| {},
        0);
}
