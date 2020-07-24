# Electron applications in Rust

It's 2020, and a lot has changed.

- With the advent of Webpack 5, the previous issues with using WASM in Electron have been
  vanquished. I can only assume some form of sorcery was involved. All examples have been updated to
  use the new version.
- `wasm32-unknown-unknown` targets are enabled for stable Rust, everything updated to 2018 edition
- The previous [`percy`](https://github.com/chinedufn/percy) example has been removed. While work
  continues on the project, there haven't been any releases.
- `binaryen` has been removed.
- The "minimal" (wasm-bindgen only) example has been removed. It's easy enough to start with one of
  the framework examples and remove it if truly desired.
- A new framework [`seed`](https://github.com/seed-rs/seed) as been added as an example.
- The `stdweb` example has been freshened up:
  - It actually runs now.
  - Use `#[wasm_bindgen(start)]` to remove the app loader script
  - Don't use `innerHTML`, just set the text content directly.
- The `yew` example has been freshened up:
  - All the changes that were made to `stdweb`; actually runs, removed app loader
  - Uses an ever-so-slightly more realistic counter example.

Each app is a starter example, and can be run with `yarn install && yarn start`.
