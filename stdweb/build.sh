DIR="$(dirname $0)"
WASM_DIR="$DIR/target/wasm32-unknown-unknown"
WASM_NAME="$(cat "$DIR/Cargo.toml" | grep name | sed 's/name = "//' | sed 's/"//g')"
APP_DIR="$DIR/dist/"

if [ ! -d "$APP_DIR" ]; then
    mkdir "$APP_DIR"
fi
cp "$DIR/static/"* "$APP_DIR"

if [ -z "$(which cargo)" ]; then
    echo 'Must install `cargo` before proceeding. Please see https://rustup.rs/ for more information.'
    exit 1
fi

cargo +nightly build --target=wasm32-unknown-unknown && \
    wasm-bindgen "$WASM_DIR/debug/$WASM_NAME.wasm" --out-dir "$APP_DIR" --no-typescript && \
    # Have to use --mode=development so we can patch out the call to instantiateStreaming
    "$DIR/node_modules/webpack-cli/bin/cli.js" --mode=development "$APP_DIR/app_loader.js" -o "$APP_DIR/bundle.js" && \
    sed -i 's/.*instantiateStreaming.*//g' "$APP_DIR/bundle.js"
