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

## Vendoring Vere and It's Dependencies

```
git subtree add --prefix=vendor/argon2 --squash git@github.com:urbit/argon2.git master
git subtree add --prefix=vendor/murmur3 --squash git@github.com:urbit/murmur3.git dae94be0c0f54a399d23ea6cbe54bca5a4e93ce4
git subtree add --prefix=vendor/libuv --squash git@github.com:urbit/libuv.git urbit
git subtree add --prefix=vendor/ed25519 --squash git@github.com:urbit/ed25519.git master
git subtree add --prefix=vendor/sniproxy --squash git@github.com:urbit/sniproxy.git urbit
git subtree add --prefix=vendor/libscrypt --squash git@github.com:urbit/libscrypt.git master
git subtree add --prefix=vendor/berkeley-softfloat-3 --squash git@github.com:urbit/berkeley-softfloat-3.git master
git subtree add --prefix=vendor/secp256k1 --squash git@github.com:urbit/secp256k1.git master
git subtree add --prefix=vendor/h2o --squash git@github.com:urbit/h2o.git urbit
git subtree add --prefix=vendor/urbit --squash git@github.com:urbit/urbit.git release-candidate
```
