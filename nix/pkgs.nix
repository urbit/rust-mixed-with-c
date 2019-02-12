{ pkgs ? import ./nixpkgs.nix }:

let

  deps = import ./deps.nix { inherit pkgs; };

in

rec {
  nodehello    = import ./pkgs/nodehello    { inherit pkgs; };
  vere-tests   = import ./pkgs/vere-tests   { inherit pkgs; };
  arvo         = import ./pkgs/arvo         { inherit pkgs; };
  arvo-tests   = import ./pkgs/arvo-tests   { inherit pkgs; };
  urbit-runner = import ./pkgs/urbit-runner { inherit pkgs; };
  rusthello    = import ./pkgs/rusthello    { inherit pkgs minima extrema; };
  carnixhello  = import ./pkgs/carnixhello  { inherit pkgs minima extrema; };
  minima       = import ./pkgs/minima       { inherit pkgs; };
  extrema      = import ./pkgs/extrema      { inherit pkgs minima; };
  prog         = import ./pkgs/prog         { inherit pkgs rusthello minima; };
  hello        = import ./pkgs/hello        { inherit pkgs; };
  boot         = import ./boot              { inherit pkgs; };
  urb          = import ../pkg/urb          { inherit pkgs; };

  urbit = import ./pkgs/urbit {
    inherit pkgs;
    inherit (deps) argon2 murmur3 uv ed25519 ent sni scrypt softfloat3;
    inherit (deps) secp256k1 h2o;
    name = "urbit";
    debug = false;
  };

  urbit-debug = import ./pkgs/urbit {
    inherit pkgs;
    inherit (deps) argon2 murmur3 uv ed25519 ent sni scrypt softfloat3;
    inherit (deps) secp256k1 h2o;
    name = "urbit-debug";
    debug = true;
  };
}
