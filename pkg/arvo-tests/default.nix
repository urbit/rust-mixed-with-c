{
  pkgs ? import ../../nix/nixpkgs.nix,
  arvo, urbit
}:

let

  pkg = (import ./npm { pkgs=pkgs; }).package;

in

pkg // {
  buildInputs = pkg.buildInputs ++ [ arvo urbit ];
}
