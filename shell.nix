let

  top = import ./. {};

  pkgs = top.pkgs;

  deps =
    with pkgs;
    [ cargo rustc ];

  vendor =
    with top; [
      argon2 murmur3 libuv ed25519 sniproxy libscrypt berkeley-softfloat-3
      secp256k1 h2o urbit
    ];

in
pkgs.stdenv.mkDerivation rec {
  name        = "env";
  env         = pkgs.buildEnv { name = name; paths = deps; };
  buildInputs = deps ++ vendor;
  shellHook   = "unset NIX_LDFLAGS out LDFLAGS CFLAGS TMP";
}
