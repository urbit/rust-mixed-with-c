{ pkgs ? import ../../nix/nixpkgs.nix, minima, extrema }:

pkgs.rustPlatform.buildRustPackage rec {
  name = "rusthello";
  src  = ../../../pkg/rusthello;
  buildInputs = [ extrema minima ];
  cargoSha256 = "0d8qs92c5zdfv7qrm22681zn41v963x3x5yd8vmwpplq6x02ynaj";
  postInstall = ''
    cp -r ./include "$out"
  '';
}
