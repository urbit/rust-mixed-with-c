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
  hello-linux32 = import ../pkg/hello/release.nix linux32;
  hello-linux64 = import ../pkg/hello/release.nix linux64;
  hello-darwin  = import ../pkg/hello/release.nix darwin;

  hellodep-linux64  = import ../pkg/hellodep/release.nix linux64 {};
  hellodep-linux32  = import ../pkg/hellodep/release.nix linux32 {};
  hellodep-darwin   = import ../pkg/hellodep/release.nix darwin {};
}
