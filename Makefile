PKGS = minima extrema rusthello prog

################################################################################

.PHONY: all install release test clean

all:
	nix-build --no-out-link

install: all
	nix-env -f . -iA urbit -iA urbit-debug

release:
	sh/release hello-linux32
	sh/release hello-linux64
	sh/release hello-darwin
	sh/release hellodep-linux64

test:
	nix-shell nix/test-env.nix --pure --command sh/vere-tests

clean:
	rm -rf ./out ./work ./release
	rm -f result result-*
