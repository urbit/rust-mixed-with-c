{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "ed25519";
  nativeBuildInputs = with pkgs; [ pkgconfig ninja meson ];
  src               = ../vendor/ed25519;
}
