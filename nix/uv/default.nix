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
  src = pkgs.fetchFromGitHub {
    owner = "urbit";
    repo = "libuv";
    rev = "6429495dc9a80aaf1c243038b381451f12bc7dcf";
    sha256 = "07m2m4v9mds0wihzjxjwswwfj3rnk2ycr3vgwfcrvnb5xjz7rs15";
  };
}
