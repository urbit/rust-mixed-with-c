##
## Using the repo directly doesn't work for now. I need to find a way to
## inject `MacOSX.sdk.tar.xz`. The uncommented out code just uses a
## directory in my computer that has that file.
##

# let
#
#   rev  = "4d4eac6ed68886191c4f224b57109960e4110abf";
#   hash = "0pxwawmssw1kgvvnbf1qq5nkkx6fc0zm7xkladk1nw9zc0jfnfc9";
#   pkgs = builtins.fetchTarball {
#     name = "nixcrpkgs-2019-01-28";
#     url = "https://github.com/pololu/nixcrpkgs/archive/${rev}.tar.gz";
#     sha256 = hash;
#   };
#
# in

import ../../nixcrpkgs
