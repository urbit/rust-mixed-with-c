source $stdenv/setup

cc -std=c99 -Wall -ffast-math -c $src/src/tls.c -o tls.o

mkdir -p $out/lib $out/include

ar rcs $out/lib/libsni.a tls.o
cp $src/src/tls.h $out/include/
