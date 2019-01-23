source $stdenv/setup

CFLAGS="-O3 -Wall -ffast-math -Wno-unused-const-variable"

echo cc $CFLAGS -c $src/src/tls.c -o tls.o
cc $CFLAGS -c $src/src/tls.c -o tls.o

mkdir -p $out/{lib,include}
ar rcs $out/lib/libsni.a tls.o
cp $src/src/tls.h $out/include/
