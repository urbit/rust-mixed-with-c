{ pkgs }:

pkgs.stdenv.mkDerivation {
  name    = "minima";
  src     = ./src;
  builder = ./builder.sh;
}
