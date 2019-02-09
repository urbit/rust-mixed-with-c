{ pkgs, minima }:

pkgs.stdenv.mkDerivation {
  name        = "extrema";
  buildInputs = [ minima ];
  src         = ../../../pkg/extrema;
  builder     = ./builder.sh;
}
