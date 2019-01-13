name ?= minima

TMP ?= ../../work
out ?= ../../out
b    = ${TMP}/${name}

CFLAGS  ?= -I${out}/include -std=c99
LDFLAGS ?= -L${out}/lib
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

clean: $b
	rm -f $b/*

################################################################################

$b:
	mkdir -p $b

$b/libminima.a:  $b/minima.o $b
	${AR} rcs $@ $<

$b/test: $b/test.o $b/libminima.a $b
	${CC} ${LDFLAGS} $< -lminima -o $@

$b/%.o: %.c minima.h $b
	${CC} ${CFLAGS} -c -o $@ $<
