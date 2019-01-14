{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "berkeley-softfloat-3";
  nativeBuildInputs = with pkgs; [ meson ninja pkgconfig ];
  src               = ../vendor/berkeley-softfloat-3;
}
