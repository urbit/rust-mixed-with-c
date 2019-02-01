source $stdenv/setup

cp -r $src ./src
chmod -R u+w .
mkdir ./build

gen_crossfile () {
    case $arch in
        i686)   cpu_family=x86;    cpu=i686;   endian=little;;
        x86_64) cpu_family=x86_64; cpu=x86_64; endian=little;;
        *) exit 1;;
    esac

    sed 's/^ *//' <<EOF
        [binaries]
        c     = '$host-gcc'
        cpp   = '$host-g++'
        ar    = '$host-ar'
        ld    = '$host-ld'
        strip = '$host-strip'

        [host_machine]
        system     = '$os'
        cpu_family = '$cpu_family'
        cpu        = '$cpu'
        endian     = '$endian'
EOF
}

if [ -n "$host" ]; then
    echo $host
    gen_crossfile > ./cross
    mesonFlags="$mesonFlags --cross-file ./cross"
fi

sed -i 's/cc\.run/cc.links/'     src/src/meson.build
sed -i 's/\.returncode() == 0//' src/src/meson.build

meson ./src ./build           \
  --buildtype=$mesonBuildType \
  --prefix "$out"             \
  $mesonFlags

ninja install -C build
