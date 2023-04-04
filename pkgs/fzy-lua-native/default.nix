{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "fzy-lua-native";
  version = "unstable-2023-04-01";

  src = fetchFromGitHub {
    owner = "romgrk";
    repo = "fzy-lua-native";
    rev = "45148b3f70d244e8b8b5db60df447a2b7ac2de9d";
    sha256 = "1c59vdjdhbn7xjvh112m35xqqr1fmqb05m6lkk3zj77kdfv3svav";
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
