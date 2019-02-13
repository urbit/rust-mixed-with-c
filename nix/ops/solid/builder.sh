source $stdenv/setup

set -ex

cp -r $FAKEZOD ./zod
chmod -R u+rw ./zod

$URBIT -d ./zod

$URB -D '|' -p "autoload"
$URB -D '%' -p "mount"

pid=$(< ./zod/.vere.lock)
kill $pid
wait $pid

cp -r $ARVO/sys            $FAKEZOD/home/
cp    $ARVO/gen/solid.hoon $FAKEZOD/home/gen/
cp    $ARVO/lib/pill.hoon  $FAKEZOD/home/lib/

$URBIT -d ./zod

$SLEEP 30 # HACK: Wait for <sync> to finish.

$URB -f urbit.pill -d '+solid, =dub &'

pid=$(< ./zod/.vere.lock)
kill $pid
wait $pid

mkdir -p "$(dirname $PILL)"

cp "$FAKEZOD/.urb/put/urbit.pill" "$PILL"

# kill "$(< $out/.vere.lock)"
