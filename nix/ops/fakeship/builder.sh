source $stdenv/setup

set -e

urbit -d -F $SHIP -B "$PILL" $out

kill $(< $out/.vere.lock) || true
