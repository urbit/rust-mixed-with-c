{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "sniproxy";
  src               = ../vendor/sniproxy;
}
