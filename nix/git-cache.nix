with (import ../default.nix {});

{
  argon2 = argon2.src;
  murmur3 = murmur3.src;
  uv = uv.src;
  ed25519 = ed25519.src;
  sni = sni.src;
  scrypt = scrypt.src;
  softfloat3 = softfloat3.src;
  secp256k1 = secp256k1.src;
  h2o = h2o.src;
  ent = ent.src;
  nodehello = nodehello.src;
  vere-tests = vere-tests.src;
  urbit = urbit.src;
}
