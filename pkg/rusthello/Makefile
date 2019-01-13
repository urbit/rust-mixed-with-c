name ?= rusthello

TMP  ?= ../../work
out  ?= ../../out
b    := ${TMP}/${name}
hack := $(shell mkdir -p $b)

################################################################################

.PHONY: all install test clean

all: $b/debug/librusthello.a include/rusthello.h

install: all
	mkdir -p ${out}/lib
	mkdir -p ${out}/include
	cp $b/debug/librusthello.a ${out}/lib
	cp include/rusthello.h ${out}/include

test:
	out=${out} CARGO_TARGET_DIR=$b cargo test

clean:
	out=${out} CARGO_TARGET_DIR=$b cargo clean

################################################################################

$b:
	mkdir -p $b

$b/debug/librusthello.a: $b
	out=${out} CARGO_TARGET_DIR=$b cargo build
