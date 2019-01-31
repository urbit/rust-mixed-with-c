source $setup

export CC=$host-gcc

# argon2 murmur3 uv sni scrypt softfloat3 secp256k1 h2o ent

export CFLAGS=
CFLAGS="$CFLAGS -I$curl/include"
CFLAGS="$CFLAGS -I$ed25519/include"
CFLAGS="$CFLAGS -I$libgmp/include"
CFLAGS="$CFLAGS -I$libsigsegv/include"
CFLAGS="$CFLAGS -I$ncurses/include"
CFLAGS="$CFLAGS -I$openssl/include"
CFLAGS="$CFLAGS -I$zlib/include"

export LDFLAGS=
LDFLAGS="$LDFLAGS -L$curl/lib -lcurl"
LDFLAGS="$LDFLAGS -L$openssl/lib -lssl -lcrypto"
LDFLAGS="$LDFLAGS -L$libgmp/lib -lgmp"
LDFLAGS="$LDFLAGS -L$ncurses/lib -lncursesw"
LDFLAGS="$LDFLAGS -L$libsigsegv/lib -lsigsegv"
LDFLAGS="$LDFLAGS -L$zlib/lib -lz"
LDFLAGS="$LDFLAGS -L$ed25519/lib -led25519"

export pkgname=$name
export workdir=$TMP
export outdir=$out

cd $src

make
make install

[ $exename = hellodep ] || mv $out/bin/{hellodep,$exename}
