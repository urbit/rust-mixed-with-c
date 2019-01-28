let

  nixpkgs = import ./nixpkgs.nix;

in

import ./nixcrpkgs
# import ./nixcrpkgs/top.nix { inherit nixpkgs; }
