{ pkgs ? import ../../nix/nixpkgs.nix, minima, extrema }:

(import ./Cargo.nix).carnixhello
