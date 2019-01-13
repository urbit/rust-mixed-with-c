CFLAGS=-O3 -Wall -std=c99
HDRS=minima.h

################################################################################

.PHONY: all install clean test

all: libminima.a minima.h

install: libminima.a minima.h
	mkdir -p ${out}/lib
	mkdir -p ${out}/include
	cp libminima.a ${out}/lib
	cp minima.h ${out}/include

clean:
	rm -f *.o *.a *.exe

test: test.exe
	./test.exe

################################################################################

libminima.a: minima.o
	ar rcs $@ $<

test.exe: test.o libminima.a
	cc $< -L./ -lminima -o $@

################################################################################

%.o: %.c ${HDRS}
	cc -c ${CFLAGS} $<
