source $stdenv/setup

meson $src $TMP
ninja -C $TMP

mkdir -p $out/lib
cp $TMP/libsecp256k1.a $out/lib

mkdir -p $out/include
cp $src/include/*.h $out/include
