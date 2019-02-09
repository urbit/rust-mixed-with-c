pkgname ?= minima
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

all: $b/libminima.a minima.h

install: all
	mkdir -p ${outdir}/lib
	mkdir -p ${outdir}/include
	cp $b/libminima.a ${outdir}/lib
	cp minima.h ${outdir}/include

test: $b/test
	$b/test

clean:
	rm -rf $b

################################################################################

$b/libminima.a: $b/minima.o
	${AR} rcs $@ $<

$b/test: $b/test.o $b/libminima.a
	${CC} ${LDFLAGS} $< -lminima -o $@

$b/%.o: %.c minima.h
	${CC} ${CFLAGS} -c -o $@ $<
