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
