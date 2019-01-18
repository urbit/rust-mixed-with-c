# Given an urbit executable, arvo, and a pier, +solid a pill.

{ pkgs, arvo, pier, urbit, urbit-runner }:

pkgs.stdenv.mkDerivation {
  name        = "solid";
  src         = ./.;
  buildInputs = [ urbit-runner urbit ];
  builder     = ./builder.sh;
  URBIT_EXE   = "${urbit}/bin/urbit";
  ARVO        = arvo;
  PIER        = pier;
}
