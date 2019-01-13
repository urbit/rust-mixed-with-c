HDRS=mid.h

################################################################################

.PHONY: all install clean test

all: prog.exe

install: prog.exe
	mkdir -p ${out}/bin
	cp prog.exe ${out}/bin/prog.exe

clean:
	rm -f *.o *.a *.exe

test: prog.exe
	./prog.exe

################################################################################

prog.exe: prog.o
	cc $< -lrusthello -lminima -lpthread -ldl -o $@

################################################################################

%.o: %.c ${HDRS}
	cc -c ${CFLAGS} $< -o $@
