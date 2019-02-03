source $setup

export pkgname=$name
export workdir=$TMP
export outdir=$out
export CC=$host-gcc

cp -r $src ./src
chmod -R u+w ./src
cd src

export PKG_CONFIG_LIBDIR=$PKG_CONFIG_CROSS_PATH
export PKG_CONFIG_PATH=$PKG_CONFIG_CROSS_PATH

export CFLAGS
export LDFLAGS

for dep in $argon2 \
           $curl \
           $ed25519 \
           $ent \
           $h2o \
           $libgmp \
           $libsigsegv \
           $murmur3 \
           $ncurses \
           $openssl \
           $scrypt \
           $secp256k1 \
           $sni \
           $softfloat3 \
           $uv \
           $zlib
do find $dep/{lib,include} -type f
   CFLAGS="$CFLAGS -I$dep/include"
   LDFLAGS="$LDFLAGS -L$dep/lib"
done

CFLAGS="$CFLAGS -I$ncurses/include/ncurses"

./build.sh

mkdir -p $out/bin
cp urbit $out/bin/$exename
