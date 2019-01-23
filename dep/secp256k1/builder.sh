source $stdenv/setup

CFLAGS="-DHAVE_CONFIG_H -Wall -I$src/include -I$src"

for u in gen_context secp256k1
do cc $CFLAGS -c $src/src/$u.c -o $u.o
done

mkdir -p $out/lib
ar rcs $out/lib/libsecp256k1.a *.o
cp -r $src/include $out/
