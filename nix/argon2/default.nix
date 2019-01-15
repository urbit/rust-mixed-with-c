{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "argon2-4da94";
  builder = ./builder.sh;
  src = builtins.fetchGit {
    name = "argon2-4da94-git";
    url = https://github.com/urbit/argon2.git;
    rev = "4da94a611ee62bad87ab2b131ffda3bcc0723d9c";
  };
}
