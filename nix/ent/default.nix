{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "ent-7506f";
  buildInputs = [ pkgs.meson pkgs.ninja ];
  patches = ./meson-install.patch;
  src = builtins.fetchGit {
    name = "ent-7506f-git";
    url = https://github.com/urbit/libent.git;
    rev = "7506fb31577fc5e185b31ed9f6ce6072e3f20637";
  };
}
