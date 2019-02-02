{ crossenv }:

crossenv.make_derivation rec {
  name    = "ent-7506f";
  builder = ./builder.sh;
  src     = ./src;

  CC = "${crossenv.host}-gcc";
  AR = "${crossenv.host}-ar";
}
