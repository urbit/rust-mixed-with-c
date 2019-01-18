#!/usr/bin/env bash

source $stdenv/setup

work=$TMP/$name

find $ARVO
find $PIER

cp -r $PIER $work
chmod -R u+w $work

find $work -type f | xargs ls -l

urbit-runner -S -o $work <<EOF
|autoload |
|mount %
EOF

cp -r $ARVO/sys            $work/home/
cp    $ARVO/gen/solid.hoon $work/home/gen/
cp    $ARVO/lib/pill.hoon  $work/home/lib/

urbit-runner -S -o $work <<EOF
.urbit/pill +solid, =dub &
EOF

cp $work/.urb/pit/urbit.pill $out
