##
## This is an experiment in getting `urbit` to build as a cross-compiled,
## statically-linked executable. This is just a hello-world application,
## but I'm going to slowly add `urbit`'s dependencies one by one, until I
## have them all working.
##
## TODO Add these dependencies to `nixcrpkgs`:
##
## - curl
## - re2c

{ env_name, env, nixpkgs }:

{ name ? "hellodep", debug ? false }:

{
  # argon2
  # murmur3
  # uv
  # ed25519
  # sni
  # scrypt
  # softfloat3
  # secp256k1
  # h2o
  # ent
}:

env.make_derivation {
  name         = "${name}-${env_name}";
  exename      = name;
  src          = ./src;
  gmp          = env.libgmp;
  ncurses      = env.ncurses;
  openssl      = env.openssl;
  sigsegv      = env.libsigsegv;
  zlib         = env.zlib;
  cross_inputs = with env; [ zlib libgmp libsigsegv openssl ncurses ];
  builder      = ./release.sh;
}
