let

  pkgs = import ./nix/pkgs.nix {};
  deps = import ./nix/deps.nix {};

in

  deps // pkgs
