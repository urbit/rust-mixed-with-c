pkgname ?= rusthello
workdir ?= ../../../work
outdir  ?= ../../../out

b    := ${workdir}/${pkgname}
hack := $(shell mkdir -p $b)

################################################################################

.PHONY: all install test clean

all: $b/debug/librusthello.a include/rusthello.h

install: all
	mkdir -p ${outdir}/lib
	mkdir -p ${outdir}/include
	cp $b/debug/librusthello.a ${outdir}/lib
	cp include/rusthello.h ${outdir}/include

test:
	out=${outdir} CARGO_TARGET_DIR=$b cargo test

clean:
	out=${outdir} CARGO_TARGET_DIR=$b cargo clean

################################################################################

$b/debug/librusthello.a:
	out=${outdir} CARGO_TARGET_DIR=$b cargo build
