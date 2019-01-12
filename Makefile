.PHONY: all clean

all:
	(cd low; make all)
	(cd mid; make all)
	(cd top; make all)

clean:
	(cd low; make clean)
	(cd mid; make clean)
	(cd top; make clean)
