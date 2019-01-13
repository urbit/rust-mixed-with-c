{ nixpkgs ?
    builtins.fetchGit {
      name = "nixpkgs-2018-11-13";
      url = https://github.com/nixos/nixpkgs/;
      rev = "695a3d4254545968fc3015142c5299c0da5ca0a9";
    }
}:

rec {
  pkgs      = nixpkgs;
  minima    = import ./pkg/minima    { inherit pkgs; };
  extrema   = import ./pkg/extrema   { inherit pkgs minima; };
  rusthello = import ./pkg/rusthello { inherit pkgs minima extrema; };
  prog      = import ./pkg/prog      { inherit pkgs minima rusthello; };
}
