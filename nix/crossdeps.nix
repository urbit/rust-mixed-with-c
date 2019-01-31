crossenv:

rec {
  argon2     = import ../dep/argon2/cross.nix     { inherit crossenv; };
  murmur3    = import ../dep/murmur3/cross.nix    { inherit crossenv; };
  uv         = import ../dep/uv/cross.nix         { inherit crossenv; };
  ed25519    = import ../dep/ed25519/cross.nix    { inherit crossenv; };
  sni        = import ../dep/sni/cross.nix        { inherit crossenv; };
  scrypt     = import ../dep/scrypt/cross.nix     { inherit crossenv; };
  softfloat3 = import ../dep/softfloat3/cross.nix { inherit crossenv; };
  secp256k1  = import ../dep/secp256k1/cross.nix  { inherit crossenv; };
  h2o        = import ../dep/h2o/cross.nix        { inherit crossenv uv; };
  ent        = import ../dep/ent/cross.nix        { inherit crossenv; };
}
