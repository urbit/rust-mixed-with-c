{ pkgs }:

pkgs.stdenv.mkDerivation {
  name        = "prog";
  src         = ../../../pkg/hello;
  builder     = ./builder.sh;
}
