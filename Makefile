PKGS = minima extrema rusthello prog

################################################################################

.PHONY: all install release test clean

all:
	nix-build --no-out-link

install: all
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
