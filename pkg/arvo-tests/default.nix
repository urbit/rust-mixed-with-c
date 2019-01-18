{ pkgs ? import ../../nix/nixpkgs.nix }:

(import ./npm { pkgs=pkgs; }).package
