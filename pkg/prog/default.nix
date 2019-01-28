{ pkgs, rusthello, minima }:

pkgs.stdenv.mkDerivation {
  name        = "prog";
  buildInputs = [ rusthello minima ];
  src         = ./src;
  builder     = ./builder.sh;
}
