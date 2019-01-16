let

  top = import ./. {};

  pkgs = top.pkgs;

  deps =
    with pkgs;
    [ cargo rustc openssl zlib pkgconfig libtool meson ninja
      curl gmp scrypt libsigsegv ncurses openssl re2c zlib ];

  vendor =
    with top;
    [ argon2 ed25519 h2o murmur3 scrypt secp256k1 sni softfloat3 uv ];

  osx =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
      [ Cocoa CoreServices ]);

in
pkgs.stdenv.mkDerivation rec {
  name        = "env";
  env         = pkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = osx ++ deps ++ vendor;
  # shellHook   = "unset NIX_LDFLAGS out LDFLAGS CFLAGS TMP";
}
