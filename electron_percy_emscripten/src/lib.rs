#![no_std]

#[macro_use]
extern crate stdweb;

use stdweb::web::Element;

#[no_mangle]
pub extern "C" fn main(x: i32) -> i32 {
    x * 2
}