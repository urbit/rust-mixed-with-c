{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "libscrypt";
  nativeBuildInputs = with pkgs; [ pkgconfig autoconf automake libtool ];
  src               = ../vendor/libscrypt;
  postInstall = ''
    mkdir -p $out/include
    cp $src/*.h $out/include
  '';
}
