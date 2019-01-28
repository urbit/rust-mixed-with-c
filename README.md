# `rust-mixed-with-c`

This was an experiment to see what it looks like to combine C and Rust
in a single project, and then it turned into a full-blow nixification
of the all urbit code.

Check out `.travis.yml` to see how this works in CI.

## Quick Start

```bash
curl https://nixos.org/nix/install | sh
  - nix-build
  - ./sh/cachix
  - nix-shell --pure --command ./sh/vere-tests
```

## Shared Build Caches

First, get `CACHIX_AUTH_TOKEN` from another dev, and then run the
following commands. You should only need to do this once.

```bash
nix-env -iA cachix -f https://cachix.org/api/v1/install
cachix authtoken "$CACHIX_AUTH_TOKEN" >/dev/null
cachix use urbit
```

In order to build everything an push results to the shared cache, run:

```bash
./sh/cachix
```

## TODOs
### Get everything working.

- Get `vere-tests` working reliably in CI.
- Get `arvo-tests` working reliably in CI.
- Use `git-lfs` to store pills and get that working in CI.

## Write build scripts for all platforms we care about.

- Write OSX build scripts.
- Write Ubuntu build scripts.
- Write OpenBSD build scripts.
- Static linking on Ubuntu.
- Mostly-static linking on OSX.
- Static linking on OpenBSD?

## DEPRECATED Iterative, Imperative Builds with Make

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

