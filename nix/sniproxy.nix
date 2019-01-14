{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "sniproxy";
  nativeBuildInputs = with pkgs; [ meson ninja pkgconfig ];
  src               = ../vendor/sniproxy;
}
