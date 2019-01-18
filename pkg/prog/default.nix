{
  pkgs ? import ../../nix/nixpkgs.nix,
  rusthello, minima
}:

pkgs.stdenv.mkDerivation {
  name = "prog";
  buildInputs = [ rusthello minima ];
  src  = ../../src/prog;
}
