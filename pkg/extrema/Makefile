name ?= extrema

TMP ?= ../../work
out ?= ../../out
b    = ${TMP}/${name}

CFLAGS  ?= -I${out}/include -std=c99
LDFLAGS ?= -L${out}/lib
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

clean: $b
	rm -f $b/*

################################################################################

$b:
	mkdir -p $b

$b/libextrema.a: $b/extrema.o $b
	${AR} rcs $@ $<

$b/test: $b/test.o $b/libextrema.a $b
	${CC} ${LDFLAGS} $< -lextrema -lminima -o $@

$b/%.o: %.c extrema.h $b
	${CC} ${CFLAGS} -c -o $@ $<
