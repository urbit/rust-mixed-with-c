let

  nixpkgs =
    builtins.fetchTarball {
      name = "nixpkgs-2019-01-15";
      url = https://github.com/nixos/nixpkgs/archive/368b72a71dee920c79d98b27b524d62550a347ec.tar.gz;
      sha256 = "0m970cy8366sdiw90345f1fa2zyicd5vinmjljfxg0nx9p934rcp";
    };

in

{ pkgs ? import nixpkgs {} }:

rec {
  inherit pkgs;

  argon2     = import ./nix/argon2     { inherit pkgs; };
  murmur3    = import ./nix/murmur3    { inherit pkgs; };
  uv         = import ./nix/uv         { inherit pkgs; };
  ed25519    = import ./nix/ed25519    { inherit pkgs; };
  sni        = import ./nix/sni        { inherit pkgs; };
  scrypt     = import ./nix/scrypt     { inherit pkgs; };
  softfloat3 = import ./nix/softfloat3 { inherit pkgs; };
  secp256k1  = import ./nix/secp256k1  { inherit pkgs; };
  h2o        = import ./nix/h2o        { inherit pkgs uv; };
  ent        = import ./nix/ent        { inherit pkgs; };
  nodehello  = import ./nix/nodehello  { inherit pkgs; };
  vere-tests = import ./nix/vere-tests { inherit pkgs urbit; };

  urbit =
    import ./nix/urbit {
      inherit pkgs;
      inherit argon2 murmur3 uv ed25519 ent sni scrypt softfloat3;
      inherit secp256k1 h2o;
    };

  minima =
    pkgs.stdenv.mkDerivation {
      name = "minima";
      src  = ./pkg/minima;
    };

  extrema =
    pkgs.stdenv.mkDerivation {
      name = "extrema";
      buildInputs = [ minima ];
      src  = ./pkg/extrema;
    };

  rusthello =
    pkgs.rustPlatform.buildRustPackage rec {
      name = "rusthello";
      src  = ./pkg/rusthello;
      buildInputs = [ extrema minima ];
      cargoSha256 = "1cgg3i06kqfqbwm8fbb2409qmlzdizm9hpg7p993swc25q2qmn3g";
      postInstall = ''
        cp -r ./include "$out"
      '';
    };

  prog =
    pkgs.stdenv.mkDerivation {
      name = "prog";
      buildInputs = [ rusthello minima ];
      src  = ./pkg/prog;
    };
}
