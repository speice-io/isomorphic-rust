use std::process::Command;

fn main() {
    Command::new("cargo")
        .args(&["build", "target=wasm32-unknown-unknown"])
        .spawn()
        .expect("Unable to build WASM distribution");
}