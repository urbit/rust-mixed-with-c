{ pkgs, rusthello, minima }:

pkgs.stdenv.mkDerivation {
  name        = "prog";
  buildInputs = [ rusthello minima ];
  src         = ../../../pkg/prog;
  builder     = ./builder.sh;
}
