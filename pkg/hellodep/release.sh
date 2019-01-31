source $setup

export CC=$host-gcc

export CFLAGS=
CFLAGS="$CFLAGS -I$gmp/include"
CFLAGS="$CFLAGS -I$ncurses/include"
CFLAGS="$CFLAGS -I$openssl/include"
CFLAGS="$CFLAGS -I$sigsegv/include"
CFLAGS="$CFLAGS -I$zlib/include"

export LDFLAGS=
LDFLAGS="$LDFLAGS -L$gmp/lib -lgmp"
LDFLAGS="$LDFLAGS -L$ncurses/lib -lncursesw"
LDFLAGS="$LDFLAGS -L$openssl/lib -lcrypto -lssl"
LDFLAGS="$LDFLAGS -L$sigsegv/lib -lsigsegv"
LDFLAGS="$LDFLAGS -L$zlib/lib -lz"

find $ncurses

export pkgname=$name
export workdir=$TMP
export outdir=$out

cd $src

make
make install

[ $exename = hellodep ] || mv $out/bin/{hellodep,$exename}
