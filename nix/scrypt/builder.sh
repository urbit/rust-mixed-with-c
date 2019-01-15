source $stdenv/setup

cp $src/* $TMP
cd $TMP
make libscrypt.so.0

mkdir -p $out/{lib,include}
cp libscrypt.a $out/lib
cp *.h $out/include
