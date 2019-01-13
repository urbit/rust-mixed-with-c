{ pkgs, minima, extrema }:

with (import pkgs {});

rustPlatform.buildRustPackage rec {
  name = "rusthello";
  src  = ./.;
  buildInputs = [ extrema minima ];
  cargoSha256 = "1cgg3i06kqfqbwm8fbb2409qmlzdizm9hpg7p993swc25q2qmn3g";
  postInstall = ''
    cp -r ./include "$out"
  '';
}
