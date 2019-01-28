{ pkgs }:

pkgs.stdenv.mkDerivation {
  name        = "prog";
  src         = ./src;
  builder     = ./builder.sh;
}
