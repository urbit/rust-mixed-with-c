CFLAGS=-O3 -Wall -std=c99
HDRS=low.h
CC=gcc

################################################################################

.PHONY: all clean test

all: liblow.a low.h

clean:
	rm -f *.o *.a *.exe

test: test.exe
	./test.exe

################################################################################

liblow.a: low.o
	ar rcs $@ $<

test.exe: test.o liblow.a
	gcc $< -L./ -llow -o $@

################################################################################

%.o: %.c ${HDRS}
	${CC} -c ${CFLAGS} $< -o $@
