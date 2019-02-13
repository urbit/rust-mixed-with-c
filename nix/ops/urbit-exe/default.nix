{ pkgs }:

(import ../../pkgs.nix {}).urbit

/*
let

  src =
    with pkgs.stdenv;
    if isDarwin
    then ../../../bin/darwin
    else if isLinux
    then ../../../bin/linux64
    else throw "There are no release exes for your platform.";

in

pkgs.stdenv.mkDerivation {
  name         = "urbit-exe";
  src          = src;
  installPhase = ''
    mkdir -p $out/bin
    cp $src/urbit        $out/bin/urbit
    cp $src/urbit-worker $out/bin/urbit-worker
  '';
}
*/
