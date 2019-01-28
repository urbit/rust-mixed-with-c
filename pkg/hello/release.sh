source $setup

export pkgname=$name
export workdir=$TMP
export outdir=$out
export CC=$host-gcc

cd $src

make
make install
