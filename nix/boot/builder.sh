#!sh/test-shell

# Given an urbit executable and a pill, create a zod pier.

set -ex

test -n "$PILL"

$URBIT -d -F zod -B "$PILL" $out

$URB -d '|exit'
