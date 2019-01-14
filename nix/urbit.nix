{
  pkgs, argon2, murmur3, libuv, ed25519, sniproxy, libscrypt,
  berkeley-softfloat-3, secp256k1, h2o
}:

let

  osx =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
        [ Cocoa CoreServices ]);

  vendor = [
    # argon2 murmur3 libuv ed25519 sniproxy libscrypt berkeley-softfloat-3
    argon2 murmur3 libuv ed25519 sniproxy berkeley-softfloat-3
    secp256k1 # h2o
  ];

  buildenv = with pkgs; [ meson ninja pkgconfig libtool ];

  # ps = with pkgs; [ curl gcc gmp libsigsegv ncurses zlib re2c openssl libscrypt ];

  deps = with pkgs; [ curl gmp libsigsegv ncurses libscrypt h2o ];

  ldflags =
     with pkgs;
     lib.optionalString stdenv.isDarwin "-framework CoreServices";

in

pkgs.stdenv.mkDerivation {
  name = "urbit";
  src = ../vendor/urbit;
  buildInputs = osx ++ buildenv ++ vendor ++ deps;
  NIX_LDFLAGS = ldflags;
}
