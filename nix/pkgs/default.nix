{ pkgs ? import ../nixpkgs.nix }:

let

  deps = import ../deps { inherit pkgs; };

in

rec {
  nodehello    = import ./nodehello    { inherit pkgs; };
  arvo         = import ./arvo         { inherit pkgs; };
  rusthello    = import ./rusthello    { inherit pkgs minima extrema; };
  carnixhello  = import ./carnixhello  { inherit pkgs minima extrema; };
  minima       = import ./minima       { inherit pkgs; };
  extrema      = import ./extrema      { inherit pkgs minima; };
  prog         = import ./prog         { inherit pkgs rusthello minima; };
  hello        = import ./hello        { inherit pkgs; };
  urb          = import ../../pkg/urb  { inherit pkgs; };

  urbit = import ./urbit {
    inherit pkgs;
    inherit (deps) argon2 murmur3 uv ed25519 ent sni scrypt softfloat3;
    inherit (deps) secp256k1 h2o;
    name = "urbit";
    debug = false;
  };

  urbit-debug = import ./urbit {
    inherit pkgs;
    inherit (deps) argon2 murmur3 uv ed25519 ent sni scrypt softfloat3;
    inherit (deps) secp256k1 h2o;
    name = "urbit-debug";
    debug = true;
  };
}
