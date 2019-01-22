name ?= minima

TMP  ?= ../../work
out  ?= ../../out
b    := ${TMP}/${name}
hack := $(shell mkdir -p $b)

CFLAGS  ?= -I${out}/include -std=c99
LDFLAGS ?= -L${out}/lib -L$b
CC      ?= cc
AR      ?= ar

################################################################################

.PHONY: all install test clean

all: $b/libminima.a minima.h

install: all
	mkdir -p ${out}/lib
	mkdir -p ${out}/include
	cp $b/libminima.a ${out}/lib
	cp minima.h ${out}/include

test: $b/test
	$b/test

clean:
	rm -f $b/*

################################################################################

$b/libminima.a: $b/minima.o
	${AR} rcs $@ $<

$b/test: $b/test.o $b/libminima.a
	${CC} ${LDFLAGS} $< -lminima -o $@

$b/%.o: %.c minima.h
	${CC} ${CFLAGS} -c -o $@ $<
