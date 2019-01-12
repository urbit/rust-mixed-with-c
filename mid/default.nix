let nixpkgs =
  builtins.fetchGit {
    name = "nixpkgs-2018-11-13";
    url = https://github.com/nixos/nixpkgs/;
    rev = "695a3d4254545968fc3015142c5299c0da5ca0a9";
  };

in

{ pkgs ? nixpkgs,
  low  ? import ../low { pkgs=nixpkgs; }
}:

with (import pkgs {});

rustPlatform.buildRustPackage rec {
  name = "mid";
  src  = ./.;
  cargoSha256 = "0q68qyl2h6i0qsz82z840myxlnjay8p1w5z7hfyr8fqp7wgwa9cx";
}
