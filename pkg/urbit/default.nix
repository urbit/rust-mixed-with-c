{
  pkgs,

  name ? "urbit",
  debug ? false,

  argon2, ed25519, ent, h2o, murmur3, scrypt, secp256k1, sni, softfloat3,
  uv
}:

let

  buildenv =
    with pkgs; [ meson ninja pkgconfig libtool ];

  deps =
    with pkgs;
    [ curl gmp scrypt libsigsegv ncurses openssl re2c zlib ];

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

  postInstall =
    pkgs.lib.optionalString (name != "urbit") ''
      echo mv $out/bin/urbit "$out/bin/${name}"
      mv $out/bin/urbit "$out/bin/${name}"
    '';

  mesonFlags =
    if debug
    then "-Dgc=true  -Dprof=true  -Deventtime=false"
    else "-Dgc=false -Dprof=false -Deventtime=false";

  mesonBuildType =
    if debug
    then "debugoptimized"
    else "release";

  src = pkgs.fetchFromGitHub {
    owner = "urbit";
    repo = "urbit";
    rev = "8b171941ca4332b3a0244fca43db457fd064e1b3";
    sha256 = "0zjq9lkl754f5x22ifnv431cp3cd3ny5rrzq74qb1icvwbw27b7p";
  };

in

pkgs.stdenv.mkDerivation {
  inherit mesonBuildType mesonFlags name NIX_LDFLAGS postInstall src;
  patches = [ ./meson-build.patch ];
  nativeBuildInputs = buildenv ++ deps ++ vendor ++ osx;
}
