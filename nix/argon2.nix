{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "argon2";
  src               = ../vendor/argon2;
}
