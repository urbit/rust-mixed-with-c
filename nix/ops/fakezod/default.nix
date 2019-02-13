{ pkgs, tlon, deps, urbit, brassPill }:

pkgs.stdenv.mkDerivation rec {
  name        = "fakezod";
  builder     = ./builder.sh;
  buildInputs = [ urbit tlon.urb ];
  PILL        = brassPill;
}
