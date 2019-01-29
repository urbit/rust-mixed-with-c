let

  nixpkgs   = import ./nixpkgs.nix;
  nixcrpkgs = import ./nixcrpkgs.nix;
  deps      = import ./deps.nix { pkgs=nixpkgs; };

  linux32   = { inherit nixpkgs; env_name="linux32"; env=nixcrpkgs.linux32; };
  linux64   = { inherit nixpkgs; env_name="linux64"; env=nixcrpkgs.linux64; };
  darwin    = { inherit nixpkgs; env_name="darwin";  env=nixcrpkgs.mac;     };

in

{
  hello-linux32 = import ../pkg/hello/release.nix linux32;
  hello-linux64 = import ../pkg/hello/release.nix linux64;
  hello-darwin  = import ../pkg/hello/release.nix darwin;

  hellodep-linux64  = import ../pkg/hellodep/release.nix linux64 {} {};
  hellodep-linux32  = import ../pkg/hellodep/release.nix linux32 {} {};
  hellodep-darwin   = import ../pkg/hellodep/release.nix darwin  {} {};
}
