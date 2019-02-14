let

  pkgs = import ../../nix/nixpkgs.nix;
  deps = import ../../nix/deps { inherit pkgs; };

in

import ./default.nix {
  inherit pkgs;
  inherit (deps)
    argon2 ed25519 ent h2o murmur3 scrypt secp256k1 sni softfloat3 uv;
}
