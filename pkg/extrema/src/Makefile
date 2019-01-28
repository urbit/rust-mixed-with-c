pkgname ?= extrema
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

all: $b/libextrema.a extrema.h

install: all
	mkdir -p ${outdir}/lib
	mkdir -p ${outdir}/include
	cp $b/libextrema.a ${outdir}/lib
	cp extrema.h ${outdir}/include

test: $b/test
	$b/test

clean:
	rm -f $b/*

################################################################################

$b/libextrema.a: $b/extrema.o
	${AR} rcs $@ $<

$b/test: $b/test.o $b/libextrema.a
	${CC} ${LDFLAGS} $< -lextrema -lminima -o $@

$b/%.o: %.c extrema.h
	${CC} ${CFLAGS} -c -o $@ $<
