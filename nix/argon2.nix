{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "argon2";
  src               = ../vendor/argon2;
  postInstall = ''
    cp $src/src/blake2/blake2.h $out/include
  '';
}
