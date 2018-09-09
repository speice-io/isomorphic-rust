extern crate stdweb;

use stdweb::web::document;
use stdweb::web::INode;
use stdweb::web::IElement;

pub fn run() {
    stdweb::initialize();

    let doc = document();
    let val = doc.create_element("p").unwrap();
    val.set_attribute("innerHTML", "IT IS ALIVE").unwrap();
    doc.body().unwrap().append_child(&val);

    stdweb::event_loop();
}
