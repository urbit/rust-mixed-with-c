source $stdenv/setup

set -ex

cp -r $SHIP ./ship
chmod -R u+rw ./ship

urbit -d ./ship

cleanup () {
  if [ -e ./ship/.vere.lock ]
  then kill $(< ./ship/.vere.lock) || true;
  fi
}

trap cleanup EXIT

urb ./ship -p hood -d '+hood/autoload |'
urb ./ship -p hood -d '+hood/mount %'

rm -r ./ship/home
cp -r $ARVO ./ship/home

urb ./ship -p hood       -d '+hood/commit %home'

urb ./ship -d '+test' | tee res

cp res $out
