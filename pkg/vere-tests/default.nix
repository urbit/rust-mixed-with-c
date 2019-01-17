{ pkgs ? import ../../nix/nixpkgs.nix, urbit }:

let

  pkg = (import ./npm { pkgs=pkgs; }).package;

in

pkg // {
  buildInputs = pkg.buildInputs ++ [ urbit ];
}
