##
## This is an experiment in getting `urbit` to build as a cross-compiled,
## statically-linked executable. This is just a hello-world application,
## but I'm going to slowly add `urbit`'s dependencies one by one, until I
## have them all working.
##

{ env_name, env, deps }:

{
  name ? "hellodep",
  debug ? false,
}:

let

  sysdeps = with env; [ curl libgmp libsigsegv ncurses openssl zlib ];

  vendor =
    with deps; [ ed25519 secp256k1 murmur3 ];
    # [ argon2 sni scrypt softfloat3 h2o ent uv ];

in

env.make_derivation {
  inherit (deps) ed25519 secp256k1 murmur3;
    # argon2 ed25519 sni scrypt softfloat3 secp256k1 h2o ent uv;

  inherit (env)
    curl libgmp ncurses openssl libsigsegv zlib;

  name         = "${name}-${env_name}";
  exename      = name;
  src          = ../../../pkg/hellodep;
  cross_inputs = sysdeps ++ vendor;
  builder      = ./release.sh;
}
