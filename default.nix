let

  nixpkgs =
    builtins.fetchGit {
      name = "nixpkgs-2018-11-13";
      url = https://github.com/nixos/nixpkgs/;
      rev = "695a3d4254545968fc3015142c5299c0da5ca0a9";
    };

in

{ pkgs ? import nixpkgs {} }:

rec {
  inherit pkgs;

  argon2     = import ./nix/argon2     { inherit pkgs; };
  murmur3    = import ./nix/murmur3    { inherit pkgs; };
  libuv      = import ./nix/libuv.nix  { inherit pkgs; };
  ed25519    = import ./nix/ed25519    { inherit pkgs; };
  sni        = import ./nix/sni        { inherit pkgs; };
  scrypt     = import ./nix/scrypt     { inherit pkgs; };
  softfloat3 = import ./nix/softfloat3 { inherit pkgs; };
  secp256k1  = import ./nix/secp256k1  { inherit pkgs; };
  h2o        = import ./nix/h2o.nix    { inherit pkgs libuv; };

  urbit =
    import ./nix/urbit.nix {
      inherit pkgs;
      inherit argon2 murmur3 libuv ed25519 sni scrypt softfloat3;
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
