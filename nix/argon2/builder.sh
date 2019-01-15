source $stdenv/setup

cp -r $src/* $TMP
chmod -R a+w $TMP
cd $TMP

sed -i 's|^PREFIX = /usr$|PREFIX = ${out}|' Makefile

make install

cp $src/src/blake2/blake2.h $out/include
rm $out/lib/libargon2.so
rm $out/lib/libargon2.so.1
