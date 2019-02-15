{ pkgs, tlon, deps, urbit, ship, arvo }:

pkgs.stdenv.mkDerivation rec {
  name        = "vere-tests";
  builder     = ./builder.sh;
  buildInputs = [ urbit tlon.urb pkgs.coreutils ];

  SHIP = ship;
  ARVO = arvo;
}
