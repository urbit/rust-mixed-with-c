let

  nixpkgs   = import ./nixpkgs.nix;
  nixcrpkgs = import ./nixcrpkgs.nix;
  deps      = import ./deps.nix { pkgs=nixpkgs; };

  linux32   = { env_name = "linux32"; env = nixcrpkgs.linux32; };
  linux64   = { env_name = "linux64"; env = nixcrpkgs.linux64; };
  darwin    = { env_name = "darwin";  env = nixcrpkgs.mac;     };

in

{
  hello-linux32 = import ../pkg/hello/release.nix linux32;
  hello-linux64 = import ../pkg/hello/release.nix linux64;
  hello-darwin  = import ../pkg/hello/release.nix darwin;

  #urbit-linux32 = import ../pkg/urbit/release.nix linux32 {
  #  pkgs = nixpkgs;
  #  inherit (deps) argon2 murmur3 uv ed25519 ent sni scrypt softfloat3;
  #  inherit (deps) secp256k1 h2o;
  #  name = "urbit";
  #  debug = false;
  #};
}
