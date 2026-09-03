.PHONY: build release test install
build:
	cargo build
release:
	cargo build --release
test:
	cargo fmt --all -- --check
	cargo test
install: release
	install -Dm755 target/release/kalcite-lsp $(DESTDIR)$(PREFIX)/bin/kalcite-lsp
