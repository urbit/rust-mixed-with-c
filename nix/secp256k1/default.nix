{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  name = "secp256k1-b4e87";
  builder = ./builder.sh;
  buildInputs = [ pkgs.gmp ];
  nativeBuildInputs = with pkgs; [pkgconfig autoconf automake libtool gnumake];
  src = builtins.fetchGit {
    name = "secp256k1-b4e87-git";
    url = https://github.com/urbit/secp256k1.git;
    rev = "b4e87986511e01ea6477838dc686cc7c08c3c8c9";
  };
}
