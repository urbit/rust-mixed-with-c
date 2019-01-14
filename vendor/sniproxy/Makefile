name ?= sniproxy

TMP  ?= ../../work
out  ?= ../../out
b    := ${TMP}/${name}
hack := $(shell mkdir -p $b)

CFLAGS ?= -std=c99 -Wall -ffast-math
CC     ?= cc
AR     ?= ar

################################################################################

.PHONY: all install clean

all: $b/libsni.a src/tls.h

install: all
	mkdir -p ${out}/lib ${out}/include
	cp $b/libsni.a ${out}/lib/
	cp src/tls.h ${out}/include/

clean:
	rm -f $b/*

################################################################################

$b/libsni.a: $b/tls.o
	${AR} rcs $@ $<

$b/%.o: src/%.c src/tls.h
	${CC} ${CFLAGS} -c -o $@ $<
