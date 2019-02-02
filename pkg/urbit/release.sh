source $setup

export pkgname=$name
export workdir=$TMP
export outdir=$out
export CC=$host-gcc

cd $src

export PKG_CONFIG_LIBDIR=$PKG_CONFIG_CROSS_PATH
export PKG_CONFIG_PATH=$PKG_CONFIG_CROSS_PATH

make
make install

[ $name = urbit ] || mv $out/bin/{urbit,$name}
