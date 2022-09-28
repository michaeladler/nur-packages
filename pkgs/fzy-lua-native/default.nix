{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "fzy-lua-native";
  version = "unstable-2022-09-28";

  src = fetchFromGitHub {
    owner = "romgrk";
    repo = "fzy-lua-native";
    rev = "085c7d262aa35cc55a8523e8c1618d398bf717a7";
    sha256 = "0wj3ypw7vdsbzxagvir7nsgvinbgz1myraa3wy7ilg42a2wdhllr";
  };

  buildInputs = [ ];

  nativeBuildInputs = [ ];

  installPhase = ''
    mkdir -p $out/share/lua/static
    mv lua $out/share/lua/5.1
    mv src/*.so $out/share/lua/static/
  '';

  meta = with lib; {
    homepage = "https://github.com/romgrk/fzy-lua-native";
    description = "Luajit FFI bindings to FZY";
    platforms = platforms.linux;
  };

}
