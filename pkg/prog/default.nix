{ pkgs      ? (import ../.. {}).pkgs,
  rusthello ? (import ../.. {}).rusthello,
  minima    ? (import ../.. {}).minima
}:

with (import pkgs {});

stdenv.mkDerivation {
  name = "prog";
  buildInputs = [ rusthello minima ];
  src  = ./.;
}
