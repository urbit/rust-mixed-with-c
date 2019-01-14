{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "murmur3";
  src               = ../vendor/murmur3;
}
