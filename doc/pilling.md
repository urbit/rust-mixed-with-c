- Three codepaths:

  1. First, try to download a pill based on the git commit hash.

    - This is totally superceded by the nix cache.

  2. Build a pill using a cached pier.

    - Depends on the `urbit-runner` executable.

    - Needs a pier/pill to start from.

      - This should be a parameter to the pill-building script, that code
        should not care.

      - To build a pill from this repo, we should use the pill stored in
        the repo (with `git-lfs`)

    - Sets up a ship for mutation, by running.

          urbit-runner -S prev/zod <<EOF
            |autoload |
            |mount %
          EOF

    - Loads the pill code into the ship with the following command, which
      copies `/sys` `gen/solid.hoon` and `gen/pill.hoon` into the pier.

          cp -r ../sys prev/zod/home/ &&
          cp ../gen/solid.hoon prev/zod/home/gen/ &&
          cp ../lib/pill.hoon  prev/zod/home/lib/

  3. Build a pill using the previous pill.

    - Also depends on the `urbit-runner` executable.

    - Get the hash of the parent commit to get a pill url.

    - Download said pill from `bootstrap.urbit.org`.

    - Use `urbit-runner` to build a new pill based on the old pill and
      the arvo package.

          urbit-runner -A .. -B prev/urbit.pill -cSF zod prev/zod <<EOF
          %booted-prev-zod
          EOF

      - TODO: Wtf is `%booted-prev-zod`?

    - This is bullshit.

      - We should just keep a bootstrapping pill in the repo itself
        (using `git-lfs`)

- Once we have a pier setup, solid the pill by running this:

      urbit-runner -S prev/zod <<EOF
        |label %home %$PILL_NAME
        .urbit/pill +solid /==/$PILL_NAME/sys, =dub &
      EOF
      cp prev/zod/.urb/put/urbit.pill urbit.pill
      mkdir built-pill; cp urbit.pill built-pill/$PILL_NAME.pill
