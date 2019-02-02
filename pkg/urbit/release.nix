{ env_name, env, deps }:

{ name ? "urbit", debug ? false }:

let

  buildenv =
    with env.nixpkgs; [ meson ninja ];

  crossdeps =
    with env;
    [ curl libgmp libsigsegv ncurses openssl zlib ];

  vendor =
    with deps;
    [ argon2 softfloat3 ed25519 ent h2o scrypt uv murmur3 secp256k1 sni ];

  osx = []; # TODO

  mesonFlags =
    if debug
    then "-Dgc=true  -Dprof=true  -Deventtime=false"
    else "-Dgc=false -Dprof=false -Deventtime=false";

  mesonBuildType =
    if debug
    then "debugoptimized"
    else "release";

in

env.make_derivation {
  inherit mesonBuildType mesonFlags;

  inherit (deps)
    argon2 ed25519 ent h2o murmur3 scrypt secp256k1 sni softfloat3 uv;

  inherit (env)
    curl libgmp ncurses openssl libsigsegv zlib;

  name          = "${name}-${env_name}";
  src           = ./src;
  native_inputs = buildenv;
  cross_inputs  = crossdeps ++ vendor ++ osx;
  builder       = ./release.sh;
}
