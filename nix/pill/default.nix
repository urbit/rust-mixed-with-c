let

  pkgs = import ../nixpkgs.nix;

in

pkgs.stdenv.mkDerivation {
  name    = "mainnet-pill";
  src     = ./urbit.pill;
  builder = ./builder.sh;
}
