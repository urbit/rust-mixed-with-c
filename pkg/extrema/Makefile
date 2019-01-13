CFLAGS=-O3 -Wall -std=c99
HDRS=extrema.h

################################################################################

.PHONY: all install clean test

all: libextrema.a extrema.h

install: libextrema.a extrema.h
	mkdir -p ${out}/lib
	mkdir -p ${out}/include
	cp libextrema.a ${out}/lib
	cp extrema.h ${out}/include

clean:
	rm -f *.o *.a *.exe result

test: test.exe
	./test.exe

################################################################################

libextrema.a: extrema.o
	ar rcs $@ $<

test.exe: test.o libextrema.a
	printenv | grep minima
	cc $< -L. -lextrema -lminima -o $@

################################################################################

%.o: %.c ${HDRS}
	cc -c ${CFLAGS} $< -o $@
