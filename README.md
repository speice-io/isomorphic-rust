# Electron applications in Rust

It's 2020, and a lot has changed.

- With the advent of Webpack 5, the previous issues with using WASM in Electron have been vanquished. I can only assume some form of sorcery was involved. All examples have been updated to use the new version.
- `wasm32-unknown-unknown` targets are enabled for stable Rust
- The previous [`percy`](https://github.com/chinedufn/percy) example has been removed. While work continues on the project, there haven't been any releases.
- `binaryen` has been removed.
- A new framework [`seed`](https://github.com/seed-rs/seed) as been added as an example.

Each app is a starter example, and can be run with `yarn install && yarn start`.