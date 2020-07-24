use wasm_bindgen::prelude::*;

use stdweb::web::document;
use stdweb::web::INode;

#[wasm_bindgen(start)]
pub fn main() {
    let doc = document();
    let val = doc.create_element("p").unwrap();
    val.set_text_content("IT IS ALIVE");
    doc.body().unwrap().append_child(&val);
}
