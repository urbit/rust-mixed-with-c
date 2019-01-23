{ pkgs ? import ./nixpkgs.nix }:

rec {
  argon2     = import ../dep/argon2       { inherit pkgs; };
  murmur3    = import ../dep/murmur3      { inherit pkgs; };
  uv         = import ../dep/uv           { inherit pkgs; };
  ed25519    = import ../dep/ed25519      { inherit pkgs; };
  sni        = import ../dep/sni          { inherit pkgs; };
  scrypt     = import ../dep/scrypt       { inherit pkgs; };
  softfloat3 = import ../dep/softfloat3   { inherit pkgs; };
  secp256k1  = import ../dep/secp256k1    { inherit pkgs; };
  h2o        = import ../dep/h2o          { inherit pkgs uv; };
  ent        = import ../dep/ent          { inherit pkgs; };
}
