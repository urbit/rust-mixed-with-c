{ pkgs }:

pkgs.stdenv.mkDerivation {
  name    = "minima";
  src     = ../../../pkg/minima;
  builder = ./builder.sh;
}
