pkgname ?= hellodep
workdir ?= ../../../work
outdir  ?= ../../../out

b    := ${workdir}/${pkgname}
hack := $(shell mkdir -p $b)

CFLAGS  ?= -I${outdir}/include -std=c99
LDFLAGS ?= -L${outdir}/lib -L$b
CC      ?= cc
AR      ?= ar

################################################################################

.PHONY: all install test clean

all: $b/hellodep

install: all
	mkdir -p ${outdir}/bin
	cp $b/hellodep ${outdir}/bin

test: $b/hellodep
	$b/hellodep

clean:
	rm -f $b/*

################################################################################

$b/hellodep: $b/hellodep.o
	${CC} ${LDFLAGS} $< -o $@

$b/%.o: %.c
	${CC} ${CFLAGS} -c -o $@ $<
