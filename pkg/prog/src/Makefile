pkgname ?= prog
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

all: $b/prog

install: all
	mkdir -p ${outdir}/bin
	cp $b/prog ${outdir}/bin

test: $b/prog
	$b/prog

clean:
	rm -f $b/*

################################################################################

$b/prog: $b/prog.o
	${CC} ${LDFLAGS} $< -lrusthello -lminima -lpthread -ldl -o $@

$b/%.o: %.c
	${CC} ${CFLAGS} -c -o $@ $<
