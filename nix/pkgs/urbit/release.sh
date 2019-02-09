source $setup

cp -r $src ./src
chmod -R u+w ./src
cd src

for dep in $cross_inputs; do
   export CFLAGS="${CFLAGS-} -I$dep/include"
   export LDFLAGS="${LDFLAGS-} -L$dep/lib"
done

CC=$host-gcc                \
PKG_CONFIG=pkg-config-cross \
HOST=$host                  \
./configure

make urbit -j8

mkdir -p $out/bin
cp urbit $out/bin/$exename
