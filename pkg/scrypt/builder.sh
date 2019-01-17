source $stdenv/setup

sources=" \
  crypto_scrypt-check \
  crypto_scrypt-hash \
  crypto_scrypt-hexconvert \
  crypto_scrypt-nosse \
  crypto-mcf \
  crypto-scrypt-saltgen \
  slowequals \
  sha256 \
  b64 \
"

CFLAGS="-I$src -Wall -ffast-math -D_FORTIFY_SOURCE=2 -fstack-protector"

for s in $sources
do cc $CFLAGS -c $src/$s.c -o $s.o
done

mkdir -p $out/{lib,include}
ar rcs $out/lib/libscrypt.a *.o
cp $src/*.h $out/include
