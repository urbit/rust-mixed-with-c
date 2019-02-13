source $stdenv/setup

set -ex

urbit -d -F zod -B "$PILL" $out

pid=$(< $out/.vere.lock)

kill $pid
