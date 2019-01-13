name ?= prog

TMP ?= ../../work
out ?= ../../out
b    = ${TMP}/${name}

CFLAGS  ?= -I${out}/include -std=c99
LDFLAGS ?= -L${out}/lib
CC      ?= cc
AR      ?= ar

################################################################################

.PHONY: all install test clean

all: $b/prog

install: all
	mkdir -p ${out}/bin
	cp $b/prog ${out}/bin

test: $b/prog
	$b/prog

clean: $b
	rm -f $b/*

################################################################################

$b:
	mkdir -p $b

$b/prog: $b/prog.o $b
	${CC} ${LDFLAGS} $< -lrusthello -lminima -lpthread -ldl -o $@

$b/%.o: %.c $b
	${CC} ${CFLAGS} -c -o $@ $<
