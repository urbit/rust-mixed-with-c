# `rust-mixed-with-c`

This is an experiment to see what it looks like to combine C and Rust
in a single project.

This is organized as a set of packages orchestrated with Nix. Each package has
it's own build (`make` for c packages, and `cargo` for Rust packages), and all
the logic for combining packages lives in `default.nix`.

## Fully-Reproducible Builds with Nix

To build and run the top-level executable, run:

    $(nix-build -A prog)/bin/prog.exe

Or, to simple build all packages, run

    nix-build

## Iterative, Imperative Builds with Make

One of the downsides of using Nix as a build system, is that it needs to fully
rebuild each package whenever anything has changed. This is especially
troublesome with the way this currently handles Rust builds. See the note about
this at the bottom.

So, for faster rebuilds, you can also just use `make`.

```
make          # Build everything.
make test     # Build and test everything.
make clean    # Delete all build artifacts
cd pkg/minima
make          # Build the `minima` package.
make clean    # Delete the build artifacts of the `minima` package.
```

## Slow Rust Builds

Since Cargo handles a package **and it's dependencies**, every nix build
of a Rust package involves a full rebuild of all dependencies.

The easy one is just to use `make` when you need faster, looser builds, but the
more satisfying solution would be to figure out how to handle Rust dependencies
with `carnix` instead of `Cargo`. However, the `carnix` documentation is pretty
bad, and I haven't managed to get it working yet.
