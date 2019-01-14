{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "libscrypt";
  src               = ../vendor/libscrypt;
  postInstall = ''
    mkdir -p $out/include
    cp $src/*.h $out/include
  '';
}
