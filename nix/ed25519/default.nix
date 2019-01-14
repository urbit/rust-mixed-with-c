{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "ed25519-76385";
  builder = ./builder.sh;
  src = builtins.fetchGit {
    name = "ed25519-76385-git";
    url = https://github.com/urbit/ed25519.git;
    rev = "76385f2ebbbc9580a9c236952d68d11d73a6135c";
  };
}
