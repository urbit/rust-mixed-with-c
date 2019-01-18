let

  pkgs = import ../nixpkgs.nix;

in

pkgs.stdenv.mkDerivation {
  name    = "bootstrap";
  src     = ./bootstrap.pill;
  builder = ./bootstrap.sh;
}
