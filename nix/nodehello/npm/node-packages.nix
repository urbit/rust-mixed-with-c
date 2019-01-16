# This file has been generated by node2nix 1.6.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "left-pad-1.3.0" = {
      name = "left-pad";
      packageName = "left-pad";
      version = "1.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/left-pad/-/left-pad-1.3.0.tgz";
        sha512 = "XI5MPzVNApjAyhQzphX8BkmKsKUxD4LdyK24iZeQGinBN9yTQT3bFlCBy/aVx2HrNcqQGsdot8ghrjyrvMCoEA==";
      };
    };
  };
  args = {
    name = "nodehello";
    packageName = "nodehello";
    version = "1.0.0";
    src = ../../../pkg/nodehello;
    dependencies = [
      sources."left-pad-1.3.0"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Hello world!";
      license = "ISC";
    };
    production = true;
    bypassCache = false;
  };
in
{
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
}