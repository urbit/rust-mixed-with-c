{ pkgs ? import ../../nix/nixpkgs.nix }:

pkgs.stdenv.mkDerivation {
  name = "minima";
  src  = ../../src/minima;
}
