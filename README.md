# Kalcite LSP

`kalcite-lsp` is the Language Server Protocol implementation for Kalcite. It
provides editor-facing diagnostics, completion, hover information, navigation,
rename support, and semantic highlighting for `.klc` source files and Kalcite
project resources.

## Capabilities

- lexical and project-aware diagnostics for `.klc` files;
- scene and resource diagnostics for `.kscn`, input maps, assets, and saves;
- completion for language and engine symbols;
- hover documentation for known engine APIs;
- go-to-definition, references, rename, document symbols, and workspace symbols;
- lexer-backed semantic tokens for keywords (including `defer`), types, functions, variables,
  numbers, and strings, with UTF-16 LSP positions for non-ASCII documents.

The server communicates over standard input/output using LSP. It is intended to
be launched by an editor or client extension rather than used interactively.

## Install and run

Rust 1.88 or newer is required.

For the recommended developer-toolchain setup, install
[Kallyup](https://github.com/Kalcite-Engine/kallyup) and run `kallyup install developer`.
Manual installation remains available:

```bash
cargo install --path .
kalcite-lsp
```

For development, run the server directly:

```bash
cargo run
```

Point the client workspace root at a Kalcite project directory containing
`kalcite.toml`. The server discovers the project's scripts, scenes, assets,
input map, and save schema from that root.

## Core compatibility

This repository is independent from the Kalcite core, but consumes its public
crates through Git dependencies. All Kalcite dependencies are pinned to the
same core tag. When adopting a new core release, update every Kalcite dependency
in `Cargo.toml`, regenerate `Cargo.lock`, and run the full test suite.

## Development

```bash
cargo fmt --all -- --check
cargo test
cargo clippy --all-targets
```

See [the development guide](docs/DEVELOPMENT.md) for repository workflow and
release checks.

## Related projects

- [Kalcite core](https://github.com/Kalcite-Engine/kalcite)
- [Kalcite editor integrations](https://github.com/Kalcite-Engine/kalcite/tree/main/editors)
- [Kalcite documentation](https://kalcite-engine.github.io/kalcite-docs/)
