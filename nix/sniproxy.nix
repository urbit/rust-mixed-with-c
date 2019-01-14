{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "sniproxy";
  nativeBuildInputs = with pkgs; [ meson ninja pkgconfig ];
  src               = ../vendor/sniproxy;
  preInstall = ''
    mkdir -p $out/include
    cp $src/src/tls.h $out/include
  '';
}
