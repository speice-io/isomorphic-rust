use std::env::var;
use std::fs::copy;
use std::path::Path;

fn main() {
    copy(
        Path::new(&format!("app/target/wasm32-unknown-unknown/{}/app.wasm", var("PROFILE").unwrap())),
        Path::new("src/app.wasm")
    ).expect("Unable to copy WASM bundle");
}
