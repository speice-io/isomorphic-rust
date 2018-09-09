#![feature(custom_attribute)]

extern crate stdweb;
extern crate wasm_bindgen;

use wasm_bindgen::prelude::*;

use stdweb::web::document;
use stdweb::web::INode;
use stdweb::web::IElement;

#[wasm_bindgen]
pub fn run() {
    let doc = document();
    let val = doc.create_element("p").unwrap();
    val.set_attribute("innerHTML", "IT IS ALIVE").unwrap();
    doc.body().unwrap().append_child(&val);
}
