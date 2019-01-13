with (import ./. {}).pkgs;

stdenv.mkDerivation rec {
  name        = "env";
  env         = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [cargo rustc];
  shellHook   = "unset NIX_LDFLAGS out LDFLAGS CFLAGS TMP";
}
