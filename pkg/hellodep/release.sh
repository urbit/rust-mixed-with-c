source $setup

export CC=$host-gcc

export CFLAGS=
CFLAGS="$CFLAGS -I$gmp/include"
CFLAGS="$CFLAGS -I$sigsegv/include"
CFLAGS="$CFLAGS -I$zlib/include"

export LDFLAGS=
LDFLAGS="$LDFLAGS -L$gmp/lib -lgmp"
LDFLAGS="$LDFLAGS -L$sigsegv/lib -lsigsegv"
LDFLAGS="$LDFLAGS -L$zlib/lib -lz"

export pkgname=$name
export workdir=$TMP
export outdir=$out

cd $src

make
make install

[ $exename = hellodep ] || mv $out/bin/{hellodep,$exename}
