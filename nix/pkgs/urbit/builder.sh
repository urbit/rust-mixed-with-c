source $stdenv/setup

cp -r $src ./src
chmod -R u+w ./src
cd src

./configure

make vere/unix.o
make urbit -j8

mkdir -p $out/bin
cp urbit $out/bin/$exename
