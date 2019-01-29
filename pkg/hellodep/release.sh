source $setup

export PKG_CONFIG=$(which pkg-config-cross)
export CC=$host-gcc
export CFLAGS="$(${PKG_CONFIG} --cflags zlib)"
export LDFLAGS="$(${PKG_CONFIG} --libs zlib)"

export pkgname=$name
export workdir=$TMP
export outdir=$out

cd $src

make
make install

[ $exename = hellodep ] || mv $out/bin/{hellodep,$exename}
