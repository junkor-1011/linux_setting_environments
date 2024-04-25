# Setup Note for Rust

[Official Page](https://www.rust-lang.org)

## rustup

### install rust-analyzer

```sh
rustup component add rust-src rust-analyzer

# check
rustup component list
```

### target

```sh
# example
rustup target add x86_64-unknown-linux-musl
rustup target add aarch64-unknown-linux-musl
rustup target add x86_64-pc-windows-gnu
rustup target add x86_64-pc-windows-msvc
rustup target add wasm32-wasi

# check
rustup target list
```

## Tools

### CLI

```sh
# build from source
cargo install <package-name>

# install compiled binary(using cargo-binstall)
cargo binstall <package-name>

# update (using cargo-update)
cargo install-update --list # check only
cargo install-update <package-name> # specify package only
cargo install-update --all # upgrade all
```

#### package management

- [cargo-binstall](https://github.com/cargo-bins/cargo-binstall)
- [cargo-update](https://github.com/nabijaczleweli/cargo-update)
- [cargo-edit](https://github.com/killercup/cargo-edit)
- [cargo-outdated](https://github.com/kbknapp/cargo-outdated)

#### Development Tools

- [cargo-watch](https://github.com/watchexec/cargo-watch)

##### wasm

- [wasm-pack](https://github.com/rustwasm/wasm-pack)

##### cross-compile

- [cross](https://github.com/cross-rs/cross)
- [cargo-zigbuild](https://github.com/rust-cross/cargo-zigbuild)
- [cargo-xwin](https://github.com/rust-cross/cargo-xwin)

#### Security

- [cargo-audit](https://github.com/RustSec/rustsec/tree/main/cargo-audit)

#### AWS

- [cargo-lambda](https://github.com/cargo-lambda/cargo-lambda)

### VS Code Setting

- [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)
    - [Linting with clippy](https://code.visualstudio.com/docs/languages/rust#_linting)
        - [VSCodeでRustの開発環境を構築する](https://zenn.dev/bryutus/articles/rust-set-up-vscode#%E4%BE%BF%E5%88%A9%E3%81%AA%E9%96%8B%E7%99%BA%E3%83%84%E3%83%BC%E3%83%AB%E3%82%92%E9%96%8B%E7%99%BA%E4%B8%AD%E3%81%AB%E4%BD%BF%E3%81%86)
        - [VSCodeでLinterにClippyを使う](https://minerva.mamansoft.net/Notes/VSCode%E3%81%A7Linter%E3%81%ABClippy%E3%82%92%E4%BD%BF%E3%81%86)
        - https://rust-analyzer.github.io/manual.html#clippy

```json:settings.json
{
  "rust-analyzer.check.command": "clippy"
}
```
