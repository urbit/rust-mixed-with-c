let

  tlon = import ./. {};

  pkgs = tlon.pkgs;

  tools =
    with pkgs;
    [ cargo rustc meson ninja pkgconfig libtool ];

  libs =
    with pkgs;
    [ openssl zlib curl gmp scrypt libsigsegv ncurses openssl re2c zlib ];

  osx =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
      [ Cocoa CoreServices ]);

  vendor =
    with tlon;
    [ argon2 ed25519 h2o murmur3 scrypt secp256k1 sni softfloat3 uv nodehello ];

in
pkgs.stdenv.mkDerivation rec {
  name        = "env";
  env         = pkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = tools ++ libs ++ osx ++ vendor;
# shellHook   = "unset NIX_LDFLAGS out LDFLAGS CFLAGS TMP";
}
