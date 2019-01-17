source $stdenv/setup

cp -r $src/* $TMP
chmod -R a+w $TMP
cd $TMP

sed -i 's|^PREFIX = /usr$|PREFIX = ${out}|' Makefile

make install -j4

cp $src/src/blake2/blake2.h $out/include
rm -f $out/lib/libargon2*dylib
rm -f $out/lib/libargon2*so*
