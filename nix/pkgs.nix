{ pkgs ? import ./nixpkgs.nix }:

let

  deps = import ./deps.nix { inherit pkgs; };

in

rec {
  nodehello    = import ../pkg/nodehello    { inherit pkgs; };
  vere-tests   = import ../pkg/vere-tests   { inherit pkgs; };
  arvo         = import ../pkg/arvo         { inherit pkgs; };
  arvo-tests   = import ../pkg/arvo-tests   { inherit pkgs; };
  urbit-runner = import ../pkg/urbit-runner { inherit pkgs; };
  rusthello    = import ../pkg/rusthello    { inherit pkgs minima extrema; };
  carnixhello  = import ../pkg/carnixhello  { inherit pkgs minima extrema; };
  minima       = import ../pkg/minima       { inherit pkgs; };
  extrema      = import ../pkg/extrema      { inherit pkgs minima; };
  prog         = import ../pkg/prog         { inherit pkgs rusthello minima; };
  hello        = import ../pkg/hello        { inherit pkgs; };

  urbit = import ../pkg/urbit {
    inherit pkgs;
    inherit (deps) argon2 murmur3 uv ed25519 ent sni scrypt softfloat3;
    inherit (deps) secp256k1 h2o;
    name = "urbit";
    debug = false;
  };

  urbit-debug = import ../pkg/urbit {
    inherit pkgs;
    inherit (deps) argon2 murmur3 uv ed25519 ent sni scrypt softfloat3;
    inherit (deps) secp256k1 h2o;
    name = "urbit-debug";
    debug = true;
  };
}
