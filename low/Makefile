CFLAGS=-O3 -Wall -std=c99
HDRS=low.h

################################################################################

.PHONY: all clean test

all: liblow.a low.h

install: liblow.a low.h
	mkdir -p ${out}/lib
	mkdir -p ${out}/include
	cp liblow.a ${out}/lib
	cp low.h ${out}/include

clean:
	rm -f *.o *.a *.exe

test: test.exe
	./test.exe

################################################################################

liblow.a: low.o
	ar rcs $@ $<

test.exe: test.o liblow.a
	ld $< -L./ -llow -o $@

################################################################################

%.o: %.c ${HDRS}
	cc -c ${CFLAGS} $< -o $@
