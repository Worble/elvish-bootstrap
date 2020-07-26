echo "Setting up Rust"

rustup install stable
rustup default stable
rustup component add rls rust-analysis rust-src rustfmt clippy