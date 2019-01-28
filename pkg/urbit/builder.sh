source $stdenv/setup

export pkgname=$name
export workdir=$TMP
export outdir=$out

cd $src

make
make install

[ $name = urbit ] || mv $out/bin/{urbit,$name}
