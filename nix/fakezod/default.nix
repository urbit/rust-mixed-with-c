# Given an urbit executable and a pill, crate a zod pier.

{ pkgs, urbit, pill, urbit-runner }:

pkgs.stdenv.mkDerivation {
  name        = "fakezod";
  src         = ./.;
  buildInputs = [ urbit-runner urbit ];
  builder     = ./builder.sh;
  URBIT_EXE   = "${urbit}/bin/urbit";
  PILL        = pill;
}
