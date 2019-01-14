{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name              = "argon2";
  nativeBuildInputs = [ meson ninja pkgconfig ];
  src               = ../vendor/argon2;
}
