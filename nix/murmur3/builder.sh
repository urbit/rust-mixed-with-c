source $stdenv/setup

cc -fPIC -O3 -o murmur3.o -c $src/murmur3.c
mkdir -p $out/{lib,include}
ar rcs $out/lib/libmurmur3.a murmur3.o
cp $src/murmur3.h $out/include
