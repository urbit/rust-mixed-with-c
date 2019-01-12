CFLAGS=-O3 -Wall -std=c99
LDFLAGS=-L. -lmid -llow -lpthread -ldl
HDRS=mid.h
CC=gcc
LD=gcc

################################################################################

.PHONY: all clean test

all: top.exe

clean:
	rm -f *.o *.a *.exe

test: top.exe
	./top.exe

################################################################################

libmid.a: ../mid/target/release/libmid.a
	cp $< $@

liblow.a: ../low/liblow.a
	cp $< $@

top.exe: top.o libmid.a liblow.a
	${LD} $< ${LDFLAGS} -o $@

################################################################################

%.o: %.c ${HDRS}
	${CC} -c ${CFLAGS} $< -o $@
