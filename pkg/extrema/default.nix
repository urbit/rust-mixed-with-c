{
  pkgs ? import ../../nix/nixpkgs.nix,
  minima
}:

pkgs.stdenv.mkDerivation {
  name = "extrema";
  buildInputs = [ minima ];
  src  = ./src;
}
