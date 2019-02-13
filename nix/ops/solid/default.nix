{ pkgs, tlon, deps, urbit, brassPill, fakezod, arvo }:

let

  tools =
    with pkgs;
    [ cargo rustc meson ninja pkgconfig libtool gdb ];

  libs =
    with pkgs;
    [ openssl zlib curl gmp scrypt libsigsegv ncurses openssl zlib ];

  osx =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
      [ Cocoa CoreServices ]);

  vendor =
    with deps;
    [ argon2 ed25519 h2o murmur3 scrypt secp256k1 sni softfloat3 uv ];

  exe =
    with tlon;
    [ urbit urbit-debug nodehello vere-tests arvo-tests urbit-runner urb ];

in

pkgs.stdenv.mkDerivation rec {
  name        = "solid";
  builder     = ./builder.sh;
  buildInputs = tools ++ libs ++ osx ++ vendor ++ exe;

  SLEEP   = "${pkgs.coreutils}/bin/sleep";
  FAKEZOD = fakezod;
  URBIT   = "${urbit}/bin/urbit";
  URB     = "${tlon.urb}/bin/urb";
  ARVO    = arvo;
}
