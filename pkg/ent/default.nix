{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "ent-7506f";
  buildInputs = [ pkgs.meson pkgs.ninja pkgs.pkgconfig ];
  mesonFlags = "-Dent_install=true";
  src = pkgs.buildRustCrateHelpers.exclude [ ".git" ] ./src;
}
