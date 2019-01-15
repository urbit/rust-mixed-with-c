{ pkgs, uv }:

let

  buildInputs =
    [ uv ] ++ (with pkgs; [ meson ninja pkgconfig zlib openssl ]);

in

pkgs.stdenv.mkDerivation rec {
  name              = "h2o";
  src               = ../../vendor/h2o;
  nativeBuildInputs = buildInputs;
  postInstall = ''
    cp -r $src/include $out/include
    chmod -R a+rw $out/include
    cp $src/deps/picohttpparser/picohttpparser.h $out/include
  '';
}
