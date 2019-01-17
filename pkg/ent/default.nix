{ pkgs ? import ../../nix/nixpkgs.nix }:

pkgs.stdenv.mkDerivation rec {
  name = "ent-7506f";
  buildInputs = [ pkgs.meson pkgs.ninja ];
  patches = ./meson-install.patch;
  src = pkgs.fetchFromGitHub {
    owner = "urbit";
    repo = "libent";
    rev = "7506fb31577fc5e185b31ed9f6ce6072e3f20637";
    sha256 = "05f1567cinsybwwq6vvxxb8cizylr6w7w55747v2f7qzwjrnpcws";
  };
}
