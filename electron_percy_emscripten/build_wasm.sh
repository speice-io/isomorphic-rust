#!/bin/bash
DIR="$(dirname $0)"
WASM_DIR="$DIR/target/wasm32-unknown-unknown"
WASM_NAME="$(cat "$DIR/Cargo.toml" | grep name | sed 's/name = "//' | sed 's/"//g')"
APP_DIR="$DIR/app/"

if [ ! -f "$DIR/binaryen/bin/wasm2js" ]; then
    git clone https://github.com/WebAssembly/binaryen "$DIR/binaryen"
    pushd "$DIR/binaryen"
    cmake . && make -j8
    popd
fi

if [ ! -d "$APP_DIR" ]; then
    mkdir "$APP_DIR"
fi

if [ -z "$(which cargo)" ]; then
    echo 'Must install `cargo` before proceeding. Please see https://rustup.rs/ for more information.'
    exit 1
fi

if [ -z "$(which wasm-bindgen)" ]; then
    echo "Installing wasm-bindgen-cli"
    cargo install wasm-bindgen-cli
fi

cargo +nightly build --target=wasm32-unknown-unknown && \
    "$DIR/binaryen/bin/wasm2js" --pedantic "$WASM_DIR/debug/$WASM_NAME.wasm" -o "$WASM_DIR/debug/$WASM_NAME.js" && \
    "$DIR/node_modules/webpack-cli/bin/cli.js" "$WASM_DIR/debug/$WASM_NAME.js" -o "$APP_DIR/app.js"