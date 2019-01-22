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
  mesonFlags = "-Dgc=true";
  NIX_LDFLAGS = flags;
  src = pkgs.fetchFromGitHub {
    owner = "urbit";
    repo = "urbit";
    rev = "8b171941ca4332b3a0244fca43db457fd064e1b3";
    sha256 = "0zjq9lkl754f5x22ifnv431cp3cd3ny5rrzq74qb1icvwbw27b7p";
  };
}
