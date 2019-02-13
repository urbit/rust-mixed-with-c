source $stdenv/setup

set -ex

cp -r $FAKEZOD ./zod
chmod -R u+rw ./zod

urbit -d ./zod

pid=$(< ./zod/.vere.lock)

cleanup () {
  kill $pid || true
}

lens_port () {
  cat ./zod/.http.ports | grep 'insecure loopback' | sed 's/ .*//'
}

trap cleanup EXIT

export LENS_PORT=$(lens_port)

urb -p hood -d '+hood/autoload |'
urb -p hood -d "+hood/mount %"

cp -r $ARVO/sys            ./zod/home/
cp    $ARVO/gen/solid.hoon ./zod/home/gen/
cp    $ARVO/lib/pill.hoon  ./zod/home/lib/

urb -f urbit.pill -d '+solid, =dub &'

cp ./zod/.urb/put/urbit.pill $out
