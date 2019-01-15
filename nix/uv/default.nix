{ pkgs }:

let

  osxBuildInputs =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
      [ Cocoa CoreServices ]);

  autotools =
    with pkgs;
    [ pkgconfig autoconf automake libtool gnumake ];

in

pkgs.stdenv.mkDerivation rec {
  name = "uv-64294";
  buildInputs = autotools ++ osxBuildInputs;
  builder = ./builder.sh;
  src = builtins.fetchGit {
    name = "uv-64294-git";
    url = https://github.com/urbit/libuv.git;
    rev = "6429495dc9a80aaf1c243038b381451f12bc7dcf";
  };
}
