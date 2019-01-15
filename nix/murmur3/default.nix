{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "murmur3-71a75";
  builder = ./builder.sh;
  src = builtins.fetchGit {
    name = "murmur3-71a75-git";
    url = https://github.com/urbit/murmur3.git;
    rev = "71a75d57ca4e7ca0f7fc2fd84abd93595b0624ca";
  };
}
