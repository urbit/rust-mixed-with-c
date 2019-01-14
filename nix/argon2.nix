{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name              = "argon2";
  nativeBuildInputs = with pkgs; [ meson ninja pkgconfig ];
  src               = ../vendor/argon2;
}
