{ pkgs ? import ../../nix/nixpkgs.nix }:

pkgs.stdenv.mkDerivation rec {
  name = "secp256k1-b4e87";
  builder = ./builder.sh;
  buildInputs = [ pkgs.gmp ];
  nativeBuildInputs = with pkgs; [pkgconfig autoconf automake libtool gnumake];
  src = pkgs.fetchFromGitHub {
    owner = "urbit";
    repo = "secp256k1";
    rev = "b4e87986511e01ea6477838dc686cc7c08c3c8c9";
    sha256 = "079la54infcn17f4n837xbvx8daxqhzxba96hn2gqndav42hpd1s";
  };
}
