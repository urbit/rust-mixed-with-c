source $stdenv/setup

meson $src $TMP
ninja -C $TMP

mkdir -p $out/lib
cp $TMP/libh2o.a $out/lib
cp -r $src/include $out/
chmod -R u+rw $out/include
cp $src/deps/picohttpparser/picohttpparser.h $out/include
