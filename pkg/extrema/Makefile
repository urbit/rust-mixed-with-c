name ?= extrema

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

all: $b/libextrema.a extrema.h

install: all
	mkdir -p ${out}/lib
	mkdir -p ${out}/include
	cp $b/libextrema.a ${out}/lib
	cp extrema.h ${out}/include

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
