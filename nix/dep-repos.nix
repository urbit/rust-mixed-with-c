with (import ./deps.nix {});

{
  argon2-src     = argon2.src;
  ed25519-src    = ed25519.src;
  ent-src        = ent.src;
  h2o-src        = h2o.src;
  murmur3-src    = murmur3.src;
  nodehello-src  = nodehello.src;
  scrypt-src     = scrypt.src;
  secp256k1-src  = secp256k1.src;
  sni-src        = sni.src;
  softfloat3-src = softfloat3.src;
  uv-src         = uv.src;
}
