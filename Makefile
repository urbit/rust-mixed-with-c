PKGS = minima extrema rusthello prog

build:
	for x in ${PKGS}; do (cd pkg/$$x; make install); done

test:
	for x in ${PKGS}; do (cd pkg/$$x; make install test); done

clean:
	rm -rf ./out ./work
	rm -f result result-*
