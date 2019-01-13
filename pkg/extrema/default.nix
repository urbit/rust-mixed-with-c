{ pkgs, minima }:

with (import pkgs {});

stdenv.mkDerivation {
  name = "extrema";
  buildInputs = [ minima ];
  src  = ./.;
}
