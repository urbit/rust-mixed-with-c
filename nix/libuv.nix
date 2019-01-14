{ pkgs }:

let

  osxBuildInputs =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
      [ Cocoa CoreServices ]);
in

pkgs.stdenv.mkDerivation rec {
  name              = "libuv";
  nativeBuildInputs = with pkgs; [ meson ninja pkgconfig ];
  buildInputs       = osxBuildInputs;
  src               = ../vendor/libuv;
}
