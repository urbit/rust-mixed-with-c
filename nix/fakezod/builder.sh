source $stdenv/setup

set -ex

$URBIT -d -F zod -B "$PILL" $out

kill "$(< $out/.vere.lock)"
