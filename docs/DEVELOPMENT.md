# Developing Kalcite LSP

## Scope

This repository owns LSP protocol behavior and editor-facing language
intelligence. Parsing, compilation, project discovery, scenes, assets, and
runtime contracts remain in the Kalcite core repository.

## Local checks

Run all checks before opening a pull request:

```bash
cargo fmt --all -- --check
cargo test
cargo clippy --all-targets
```

Add a regression test in `src/main.rs` whenever a diagnostic, completion, or
symbol-navigation behavior changes.

## Updating the core dependency

1. Wait for a tagged Kalcite core release.
2. Update every `kalcite-*` Git dependency in `Cargo.toml` to that tag.
3. Run `cargo update` to refresh `Cargo.lock`.
4. Run the full local check set.
5. Record the compatibility change in the pull request description.

Do not mix core tags in one lockfile. A compatibility issue belongs either in
the core repository or in this repository, depending on whether the public
contract or the LSP interpretation is at fault.

## Release checklist

1. CI is green on `main`.
2. The supported core tag is documented in the README and lockfile.
3. New protocol behavior has a regression test.
4. A release tag points to the exact reviewed commit.
