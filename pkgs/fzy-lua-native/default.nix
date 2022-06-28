{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "fzy-lua-native";
  version = "unstable-2021-08-02";

  src = fetchFromGitHub {
    owner = "romgrk";
    repo = "fzy-lua-native";
    rev = "aa00feb01128c4d279c8471898e15898e75d5df5";
    sha256 = "03sdsbw0sg8l1hi469zd8fdxi8aiwf5h3pq3dsyp2pprkj65sf95";
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
