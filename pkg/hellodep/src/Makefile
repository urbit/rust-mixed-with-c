pkgname ?= hellodep
workdir ?= ../../../work
outdir  ?= ../../../out

b    := ${workdir}/${pkgname}
hack := $(shell mkdir -p $b)

CFLAGS  := ${CFLAGS} -std=c99

################################################################################

.PHONY: all install test clean

all: $b/hellodep

install: all
	mkdir -p ${outdir}/bin
	cp $b/hellodep ${outdir}/bin

test: $b/hellodep
	$b/hellodep

clean:
	rm -f $b/*

################################################################################

$b/hellodep: $b/hellodep.o
	echo ${CC} $< ${LDFLAGS} -o $@
	${CC} $< ${LDFLAGS} -o $@

$b/%.o: %.c
	echo ${CC} ${CFLAGS} -c -o $@ $<
	${CC} ${CFLAGS} -c -o $@ $<
