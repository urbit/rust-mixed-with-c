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
  linux32 = linux32.deps // {
    hello    = import ../pkg/hello/release.nix linux32;
    hellodep = import ../pkg/hellodep/release.nix linux32 {};
  };

  linux64 = linux64.deps // {
    hello    = import ../pkg/hello/release.nix linux64;
    hellodep = import ../pkg/hellodep/release.nix linux64 {};
  };

  darwin = darwin.deps // {
    hello    = import ../pkg/hello/release.nix darwin;
    hellodep = import ../pkg/hellodep/release.nix darwin {};
  };

}
