DIR="$(dirname $0)"
WASM_DIR="$DIR/target/wasm32-unknown-unknown"
NAME="$(cat "$DIR/Cargo.toml" | grep name | sed 's/name = "//' | sed 's/"//g')"
APP_DIR="$DIR/dist"

if [ ! -d "$APP_DIR" ]; then
    mkdir "$APP_DIR"
fi
cp "$DIR/static/"* "$APP_DIR"

# Note: We'd normally prefer to use something like `wasm-pack` as a "production-ready" packager.
# However, when `wasm-pack` runs, it uses `wasm-bindgen` (which ultimately uses webpack 4.X) to
# build the Javascript bindings and thus still suffers from webpack/webpack#7918. Because we use
# the webpack CLI directly here, we benefit from changes in 5.X (specifically,
# the `asyncWebAssembly` experiment).
cargo build --target=wasm32-unknown-unknown && \
    wasm-bindgen "$WASM_DIR/debug/$NAME.wasm" --out-dir "$APP_DIR" && \
    "$DIR/node_modules/webpack-cli/bin/cli.js" "$APP_DIR/$NAME.js" -o "$APP_DIR/bundle.js"
