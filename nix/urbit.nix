{
  pkgs, argon2, murmur3, libuv, ed25519, sni, libscrypt, softfloat3,
  secp256k1, h2o
}:

let

  buildenv = with pkgs; [ meson ninja pkgconfig libtool ];

  deps = with pkgs; [ curl gmp libscrypt libsigsegv ncurses openssl re2c zlib ];

  osx =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
        [ Cocoa CoreServices ]);

  vendor = [
    argon2 softfloat3 ed25519 h2o libscrypt libuv murmur3 secp256k1 sni
  ];

  flags =
     with pkgs;
     lib.optionalString stdenv.isDarwin
       "-framework CoreServices -framework CoreFoundation";

in

pkgs.stdenv.mkDerivation {
  name = "urbit";
  src = ../vendor/urbit;
  nativeBuildInputs = osx ++ buildenv ++ vendor ++ deps;
  NIX_LDFLAGS = flags;
}
