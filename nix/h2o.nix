{ pkgs, libuv }:

let

  buildInputs =
    [libuv] ++
      (with pkgs; [ meson ninja pkgconfig zlib openssl ]);

in

pkgs.stdenv.mkDerivation rec {
  name              = "h2o";
  src               = ../vendor/h2o;
  nativeBuildInputs = buildInputs;
}
