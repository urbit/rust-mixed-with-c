PKGS = minima extrema rusthello prog

.PHONY: build test clean

build:
	for x in ${PKGS}; do (cd pkg/$$x; make install); done

test: build
	for x in ${PKGS}; do (cd pkg/$$x; make test); done

clean:
	rm -rf ./out ./work
