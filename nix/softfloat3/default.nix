{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "softfloat3-ec4c7";
  builder = ./builder.sh;
  src =
    builtins.fetchGit {
      name = "softfloat3-ec4c7-git";
      url = https://github.com/urbit/berkeley-softfloat-3.git;
      rev = "ec4c7e31b32e07aad80e52f65ff46ac6d6aad986";
    };
}
