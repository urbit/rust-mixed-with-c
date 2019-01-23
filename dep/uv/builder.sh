source $stdenv/setup

cp -r $src $TMP/$name
chmod -R a+w $TMP/$name
cd $TMP/$name

LIBTOOLIZE=libtoolize ./autogen.sh
./configure --prefix=$out
make install
