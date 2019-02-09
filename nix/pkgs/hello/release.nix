{ env_name, env, deps }:

env.make_derivation {
  name    = "hello-${env_name}";
  src     = ../../../pkg/hello;
  builder = ./release.sh;
}
