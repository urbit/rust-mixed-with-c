# `rust-mixed-with-c`

This is an experiment to see what it looks like to combine C and Rust
in a single project.

This is organized as a set of packages orchestrated with Nix. Each package has
it's own build (`make` for c packages, and `cargo` for Rust packages), and all
the logic for combining packages lives in `default.nix`.

## Running

To build and run the top-level executable, run:

    $(nix-build -A prog)/bin/prog.exe

Or, to simple build all packages, run

    nix-build
