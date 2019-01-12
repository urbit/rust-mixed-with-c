{ pkgs ?
    builtins.fetchGit {
      name = "nixpkgs-2018-11-13";
      url = https://github.com/nixos/nixpkgs/;
      rev = "695a3d4254545968fc3015142c5299c0da5ca0a9";
    }
}:

with (import pkgs {});

stdenv.mkDerivation {
  name = "low";
  src  = ./.;
}
