{ pkgs, minima }:

pkgs.stdenv.mkDerivation {
  name        = "extrema";
  buildInputs = [ minima ];
  src         = ./src;
  builder     = ./builder.sh;
}
