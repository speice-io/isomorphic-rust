#!/bin/bash

DIR="$(dirname $0)"
WASM_DIR="$DIR/target/wasm32-unknown-unknown"
WASM_NAME="$(cat "$DIR/Cargo.toml" | grep name | sed 's/name = "//' | sed 's/"//g')"
APP_DIR="$DIR/dist/"

if [ ! -f "$DIR/binaryen/bin/wasm2js" ]; then
    git clone "https://github.com/WebAssembly/binaryen" "$DIR/binaryen"
    pushd "$DIR/binaryen"
    cmake . && make -j8
    popd
fi

if [ ! -d "$APP_DIR" ]; then
    mkdir "$APP_DIR"
fi
cp "$DIR/static/"* "$APP_DIR"

if [ -z "$(which cargo)" ]; then
    echo 'Must install `cargo` before proceeding. Please see https://rustup.rs/ for more information.'
    exit 1
fi

cargo +nightly build --target=wasm32-unknown-unknown && \
    "$DIR/binaryen/bin/wasm2js" --pedantic "$WASM_DIR/debug/stdweb_electron.wasm" -o "$APP_DIR/stdweb_electron.js" && \
    "$DIR/node_modules/webpack-cli/bin/cli.js" --mode=development "$APP_DIR/stdweb_electron.js" -o "$APP_DIR/bundle.js"
