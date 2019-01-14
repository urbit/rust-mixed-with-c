PKGS = vendor/sniproxy pkg/minima pkg/extrema pkg/rusthello pkg/prog

build:
	for x in ${PKGS}; do (cd $$x; make install); done

test:
	for x in ${PKGS}; do (cd $$x; make install test); done

clean:
	rm -rf ./out ./work
