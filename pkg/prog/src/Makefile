name ?= prog

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

all: $b/prog

install: all
	mkdir -p ${out}/bin
	cp $b/prog ${out}/bin

test: $b/prog
	$b/prog

clean:
	rm -f $b/*

################################################################################

$b/prog: $b/prog.o
	${CC} ${LDFLAGS} $< -lrusthello -lminima -lpthread -ldl -o $@

$b/%.o: %.c
	${CC} ${CFLAGS} -c -o $@ $<
