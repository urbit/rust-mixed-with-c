##
## This is an experiment in getting `urbit` to build as a cross-compiled,
## statically-linked executable. This is just a hello-world application,
## but I'm going to slowly add `urbit`'s dependencies one by one, until I
## have them all working.
##

{ env_name, env, nixpkgs }:

{ name ? "hellodep", debug ? false }:

{
  # argon2,
  # curl,
  # ed25519,
  # ent,
  # gmp,
  # h2o,
  # libsigsegv,
  # murmur3,
  # ncurses,
  # openssl,
  # re2c,
  # scrypt,
  # scrypt,
  # secp256k1,
  # sni,
  # softfloat3,
  # uv
  # zlib,
}:

env.make_derivation {
  name          = "${name}-${env_name}";
  exename       = name;
  src           = ./src;
# native_inputs = buildenv;
# cross_inputs  = deps ++ vendor ++ osx;
  builder       = ./release.sh;
}
