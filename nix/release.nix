let

  nixcrpkgs = import ./nixcrpkgs.nix;

  linux32   = { env_name = "linux32"; env = nixcrpkgs.linux32; };
  linux64   = { env_name = "linux64"; env = nixcrpkgs.linux64; };
  darwin    = { env_name = "darwin";  env = nixcrpkgs.mac;     };

in

{
  hello-linux32 = import ../pkg/hello/release.nix linux32;
  hello-linux64 = import ../pkg/hello/release.nix linux64;
  hello-darwin  = import ../pkg/hello/release.nix darwin;
}
