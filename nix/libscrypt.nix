{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "libscrypt";
  nativeBuildInputs = with pkgs; [ pkgconfig autoconf automake libtool ];
  src               = ../vendor/libscrypt;
}
