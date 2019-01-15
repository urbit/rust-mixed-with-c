source $stdenv/setup

cp $src/build/Linux-386-SSE2-GCC/platform.h .
export SOURCE_DIR=$src/source
make -f $src/build/Linux-386-SSE2-GCC/Makefile

mkdir -p $out/{lib,include}
cp $src/source/include/*.h $out/include
cp softfloat.a $out/lib/libsoftfloat3.a
