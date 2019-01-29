{
  pkgs,
  name ? "urbit",
  debug ? false,
  argon2, ed25519, ent, h2o, murmur3, scrypt, secp256k1, sni, softfloat3, uv
}:

let

  buildenv =
    with pkgs; [ meson ninja pkgconfig libtool ];

  deps =
    with pkgs;
    [ curl gmp libsigsegv ncurses openssl re2c zlib ];

  vendor =
    [ argon2 softfloat3 ed25519 ent h2o scrypt uv murmur3 secp256k1 sni ];

  osx =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
        [ Cocoa CoreServices ]);

  NIX_LDFLAGS =
    pkgs.lib.optionalString pkgs.stdenv.isDarwin
      "-framework CoreServices -framework CoreFoundation";

  mesonFlags =
    if debug
    then "-Dgc=true  -Dprof=true  -Deventtime=false"
    else "-Dgc=false -Dprof=false -Deventtime=false";

  mesonBuildType =
    if debug
    then "debugoptimized"
    else "release";

  # This package doesn't use Rust, but this is a very useful utility.
  exclude = pkgs.buildRustCrateHelpers.exclude;

in

pkgs.stdenv.mkDerivation {
  inherit mesonBuildType mesonFlags name NIX_LDFLAGS;
  src = exclude [ ".git" "build" ] ./src;
  nativeBuildInputs = buildenv ++ deps ++ vendor ++ osx ++ [ pkgs.git ];
  builder = ./builder.sh;
}
