{ pkgs ? import ./nix/nixpkgs.nix }:

rec {
  inherit pkgs;

  argon2     = import ./pkg/argon2     { inherit pkgs; };
  murmur3    = import ./pkg/murmur3    { inherit pkgs; };
  uv         = import ./pkg/uv         { inherit pkgs; };
  ed25519    = import ./pkg/ed25519    { inherit pkgs; };
  sni        = import ./pkg/sni        { inherit pkgs; };
  scrypt     = import ./pkg/scrypt     { inherit pkgs; };
  softfloat3 = import ./pkg/softfloat3 { inherit pkgs; };
  secp256k1  = import ./pkg/secp256k1  { inherit pkgs; };
  h2o        = import ./pkg/h2o        { inherit pkgs uv; };
  ent        = import ./pkg/ent        { inherit pkgs; };
  nodehello  = import ./pkg/nodehello  { inherit pkgs; };
  vere-tests = import ./pkg/vere-tests { inherit pkgs urbit; };
  arvo       = import ./pkg/arvo       { inherit pkgs; };

  urbit =
    import ./pkg/urbit {
      inherit pkgs;
      inherit argon2 murmur3 uv ed25519 ent sni scrypt softfloat3;
      inherit secp256k1 h2o;
    };

  rusthello =
    import ./pkg/rusthello { inherit pkgs minima extrema; };

  carnixhello =
    import ./pkg/carnixhello { inherit pkgs minima extrema; };

  minima =
    pkgs.stdenv.mkDerivation {
      name = "minima";
      src  = ./src/minima;
    };

  extrema =
    pkgs.stdenv.mkDerivation {
      name = "extrema";
      buildInputs = [ minima ];
      src  = ./src/extrema;
    };

  prog =
    pkgs.stdenv.mkDerivation {
      name = "prog";
      buildInputs = [ rusthello minima ];
      src  = ./src/prog;
    };
}
