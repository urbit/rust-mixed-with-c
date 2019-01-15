{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "scrypt-02969";
  builder = ./builder.sh;
  src = builtins.fetchGit {
    name = "scrypt-02969-git";
    url = https://github.com/urbit/libscrypt.git;
    rev = "029693ff1cbe4f69d3a2da87d0f4f034f92cc0c2";
  };
}
