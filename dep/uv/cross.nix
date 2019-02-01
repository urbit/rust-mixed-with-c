{ crossenv }:

let

  osx =
    if crossenv.os == "macos"
    then builtins.trace crossenv.sdk
         [ ] # Cocoa CoreServices ]
    else [];

in

crossenv.make_derivation rec {
  name          = "uv-64294";
  native_inputs = osx ++ (with crossenv.nixpkgs; [autoconf automake libtool m4]);
  builder       = ./builder.sh;

  CFLAGS         = "-fPIC";
  configureFlags = [ "--disable-shared" ];

  src = crossenv.nixpkgs.fetchFromGitHub {
    owner = "urbit";
    repo = "libuv";
    rev = "6429495dc9a80aaf1c243038b381451f12bc7dcf";
    sha256 = "07m2m4v9mds0wihzjxjwswwfj3rnk2ycr3vgwfcrvnb5xjz7rs15";
  };
}
