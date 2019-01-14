{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "secp256k1";
  nativeBuildInputs = with pkgs; [ meson ninja pkgconfig ];
  buildInputs       = with pkgs; [ gmp ];
  src               = ../vendor/secp256k1;
}
