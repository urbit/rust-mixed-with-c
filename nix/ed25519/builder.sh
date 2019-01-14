source $stdenv/setup

for fn in $src/src/*.c
do cc -Wall -I$src/src -c $fn -o $(basename $fn).o
done

mkdir -p $out/{lib,include}
ar rcs $out/lib/libed25519.a *.o
cp $src/src/*.h $out/include
