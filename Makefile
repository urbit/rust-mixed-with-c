PKGS = minima extrema rusthello prog

################################################################################

.PHONY: build all install release test clean

build:
	nix-build --no-out-link

all: build release test

install: build
	nix-env -f . -iA urbit -iA urbit-debug

release:
	sh/release urbit-debug linux32
	sh/release urbit-debug linux64
	sh/release urbit-debug darwin
	sh/release urbit linux32
	sh/release urbit linux64
	sh/release urbit darwin

test:
	nix-shell nix/test-env.nix --pure --command sh/vere-tests

clean:
	rm -rf ./out ./work ./release
	rm -f result result-*
