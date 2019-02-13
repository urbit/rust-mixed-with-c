{ pkgs ? import ../nixpkgs.nix }:

let

  deps = import ../deps.nix { inherit pkgs; };
  tlon = import ../pkgs.nix { inherit pkgs; };

  brassPill = ../../bin/pill/brass.pill;

in

rec {
  urbit = import ./urbit-exe { inherit pkgs; };

  fakezod = import ./fakezod {
    inherit pkgs tlon deps urbit brassPill;
  };

  solid = import ./solid {
    inherit pkgs tlon deps urbit brassPill fakezod;
    inherit (tlon) arvo;
  };
}
