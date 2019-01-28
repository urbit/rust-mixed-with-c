pkgname ?= hello
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

all: $b/hello

install: all
	mkdir -p ${outdir}/bin
	cp $b/hello ${outdir}/bin

test: $b/hello
	$b/hello

clean:
	rm -f $b/*

################################################################################

$b/hello: $b/hello.o
	${CC} ${LDFLAGS} $< -o $@

$b/%.o: %.c
	${CC} ${CFLAGS} -c -o $@ $<
