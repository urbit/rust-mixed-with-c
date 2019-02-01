{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name        = "ent-7506f";
  buildInputs = [ pkgs.meson pkgs.ninja pkgs.pkgconfig ];
  builder     = ./builder.sh;

  mesonBuildType = "release";
  mesonFlags     = "-Dent_install=true";

  src = pkgs.fetchFromGitHub {
    owner = "urbit";
    repo = "libent";
    rev = "fe9f8a8aad6c4a6915ff8844850e64be4b4831a2";
    sha256 = "1pffs9mr8p0flk11qypnqfq54ijgci60iw5d7qmrckf0cjb00nn0";
  };
}
