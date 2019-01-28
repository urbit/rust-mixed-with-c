{ env_name, env }:

env.make_derivation {
  name    = "hello-${env_name}";
  src     = ./src;
  builder = ./release.sh;
}
