source $stdenv/setup

cp -r $src $TMP/$name
chmod a+w $TMP/$name
cd $TMP/$name

sed -i "s|if osdet == 'darwin'|if osdet == 'whatever'|" meson.build

meson . ./build
ninja -C ./build

mkdir -p $out/lib
cp ./build/libh2o.a $out/lib
cp -r $src/include $out/
chmod -R u+rw $out/include
cp $src/deps/picohttpparser/picohttpparser.h $out/include
