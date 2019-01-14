CFLAGS = -O3 -Wall

.PHONY: all clean tests

all: example
example: example.o murmur3.o
tests: test.o murmur3.o
	$(CC) $^ -o $@
	./tests

shared: murmur3.c murmur3.h
	$(CC) -fPIC -O3 -c murmur3.c
	$(AR) rcs libmurmur3.a murmur3.o

install: shared
	mkdir -p ${out}/lib
	cp libmurmur3.a ${out}/lib
	mkdir -p ${out}/include
	cp murmur3.h ${out}/include

clean:
	rm -rf example *.o *.so
