{
  pkgs,

  argon2, ed25519, ent, h2o, murmur3, scrypt, secp256k1, sni, softfloat3,
  uv
}:

let

  buildenv = with pkgs; [ meson ninja pkgconfig libtool ];

  deps =
    with pkgs;
    [ curl gmp scrypt libsigsegv ncurses openssl re2c zlib ];

  osx =
    with pkgs;
    lib.optionals stdenv.isDarwin (
      with darwin.apple_sdk.frameworks;
        [ Cocoa CoreServices ]);

  vendor = [
    argon2 softfloat3 ed25519 ent h2o scrypt uv murmur3 secp256k1 sni
  ];

  flags =
     with pkgs;
     lib.optionalString stdenv.isDarwin
       "-framework CoreServices -framework CoreFoundation";


in

pkgs.stdenv.mkDerivation {
  name = "urbit-71a75";
  patches = [ ./meson-build.patch ];
  nativeBuildInputs = osx ++ buildenv ++ vendor ++ deps;
  NIX_LDFLAGS = flags;
  src = pkgs.fetchFromGitHub {
    owner = "urbit";
    repo = "urbit";
    rev = "31bdb1cc3c3bf2850586497d21ff136e6dc1692e";
    sha256 = "097k2m5hn2ilg0r1zj1g6vl4vm13rl5h1izjd534ciakpbys9lxr";
  };
}
