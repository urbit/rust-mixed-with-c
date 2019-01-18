{
  pkgs ? import ../../nix/nixpkgs.nix,

  argon2, ed25519, ent, h2o, murmur3, scrypt, secp256k1, sni, softfloat3,
  uv
}:

let

  buildenv = with pkgs; [ meson ninja pkgconfig libtool ];

  deps =
    with pkgs;
    [ curl gmp scrypt libsigsegv ncurses openssl re2c zlib ];

  osx =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
        [ Cocoa CoreServices ]);

  vendor = [
    argon2 softfloat3 ed25519 ent h2o scrypt uv murmur3 secp256k1 sni
  ];

  flags =
     with pkgs;
     lib.optionalString stdenv.isDarwin
       "-framework CoreServices -framework CoreFoundation";


in

pkgs.stdenv.mkDerivation {
  name = "urbit-8b171";
  patches = [ ./meson-build.patch ];
  nativeBuildInputs = osx ++ buildenv ++ vendor ++ deps;
  NIX_LDFLAGS = flags;
  src = ../../vendor/urbit;
}
