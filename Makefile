PKGS = minima extrema rusthello prog

################################################################################

.PHONY: all install test clean

all:
	nix-build --no-out-link

install: all
	nix-env -f . -iA urbit -iA urbit-debug

test:
	nix-shell nix/test-env.nix --pure --command sh/vere-tests

clean:
	rm -rf ./out ./work
	rm -f result result-*
