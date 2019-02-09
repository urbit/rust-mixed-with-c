{ pkgs ? import ./nixpkgs.nix }:

rec {
  argon2     = import ./deps/argon2       { inherit pkgs; };
  murmur3    = import ./deps/murmur3      { inherit pkgs; };
  uv         = import ./deps/uv           { inherit pkgs; };
  ed25519    = import ./deps/ed25519      { inherit pkgs; };
  sni        = import ./deps/sni          { inherit pkgs; };
  scrypt     = import ./deps/scrypt       { inherit pkgs; };
  softfloat3 = import ./deps/softfloat3   { inherit pkgs; };
  secp256k1  = import ./deps/secp256k1    { inherit pkgs; };
  h2o        = import ./deps/h2o          { inherit pkgs uv; };
  ent        = import ./deps/ent          { inherit pkgs; };
}
