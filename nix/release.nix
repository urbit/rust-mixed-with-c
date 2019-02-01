let

  nixpkgs   = import ./nixpkgs.nix;
  nixcrpkgs = import ./nixcrpkgs.nix;
  deps      = import ./deps.nix { pkgs=nixpkgs; };

  crossdeps = import ./crossdeps.nix;

  release =
    env_name: env: {
      inherit env env_name;
      deps = crossdeps env;
    };

  linux32 = release "linux32" nixcrpkgs.linux32;
  linux64 = release "linux64" nixcrpkgs.linux64;
  darwin  = release "darwin"  nixcrpkgs.mac;

in

{
  linux32 = {
    inherit (linux32.deps) argon2 ed25519 secp256k1 murmur3 sni scrypt;
    hello    = import ../pkg/hello/release.nix linux32;
    hellodep = import ../pkg/hellodep/release.nix linux32 {};
  };

  linux64 = {
    inherit (linux64.deps) argon2 ed25519 secp256k1 murmur3 sni scrypt;
    hello    = import ../pkg/hello/release.nix linux64;
    hellodep = import ../pkg/hellodep/release.nix linux64 {};
  };

  darwin = {
    inherit (darwin.deps)  argon2 ed25519 secp256k1 murmur3 sni scrypt;
    hello    = import ../pkg/hello/release.nix darwin;
    hellodep = import ../pkg/hellodep/release.nix darwin {};
  };

}
