{ pkgs, uv }:

pkgs.stdenv.mkDerivation rec {
  name = "h2o-0ed9a";
  buildInputs = [ uv pkgs.openssl pkgs.zlib ];
  builder = ./builder.sh;
  src = builtins.fetchGit {
    name = "h2o-0ed9a-git";
    url = https://github.com/urbit/h2o.git;
    rev = "0ed9ac70757a16ec45f91b8a347850d9699c3fb1";
  };
}
