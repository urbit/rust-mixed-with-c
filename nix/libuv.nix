{ pkgs }:

let

  osxBuildInputs =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
      [ Cocoa CoreServices ]);

  autotools =
    with pkgs;
    [pkgconfig autoconf automake libtool gnumake];

in

pkgs.stdenv.mkDerivation rec {
  name              = "libuv";
  nativeBuildInputs = autotools ++ osxBuildInputs;
  src               = ../vendor/libuv;

  preConfigure = ''
    LIBTOOLIZE=libtoolize ./autogen.sh
  '';
}
