let

  pkgs = import ./nix/nixpkgs.nix;

  tlon = import ./nix/tlon.nix { pkgs=pkgs; };

  tools =
    with pkgs;
    [ cargo rustc meson ninja pkgconfig libtool gdb ];

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
    [ argon2 ed25519 h2o murmur3 scrypt secp256k1 sni softfloat3 uv ];

  exe =
    with tlon;
    [ urbit urbit-debug nodehello vere-tests arvo-tests urbit-runner ];

in

pkgs.stdenv.mkDerivation rec {
  name        = "env";
  env         = pkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = tools ++ libs ++ osx ++ vendor ++ exe;
  URBIT_EXE   = "${tlon.urbit}/bin/urbit";
  URBIT_DEBUG = "${tlon.urbit-debug}/bin/urbit-debug";
  BOOTPILL    = ./pill/bootstrap.pill;
  FAKEZOD     = "./out/fakezod";
  PILL        = "./out/urbit.pill";
  ARVO        = tlon.arvo;
}
