{ pkgs ? import ../../nix/nixpkgs.nix }:

pkgs.stdenv.mkDerivation {
  name = "arvo-000q9";
  builder = ./builder.sh;
  src = pkgs.fetchFromGitHub {
    owner = "urbit";
    repo = "arvo";
    rev = "62f20d8139260e9957a258d9476bb841322e8d3b";
    sha256 = "02cadvziy3qvzxh7jv54pdjk4659m294nw2i5rsgavf7sb4nl4jm";
  };
}
