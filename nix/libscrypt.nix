{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "libscrypt";
  nativeBuildInputs = with pkgs; [ meson ninja pkgconfig ];
  src               = ../vendor/libscrypt;
}
