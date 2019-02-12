{ pkgs ? import ./nixpkgs.nix }:

let

  deps = import ./deps.nix { inherit pkgs; };
  tlon = import ./pkgs.nix { inherit pkgs; };

in

rec {
  fakezod = import ./fakezod { inherit pkgs; };
}
