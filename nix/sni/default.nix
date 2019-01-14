{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "sni";
  builder = ./builder.sh;
  src = builtins.fetchGit {
    name = "sni-173be";
    url = https://github.com/urbit/sniproxy.git;
    rev = "173beb88ee62bddd13874ca04ab338cdec704928";
  };
}
