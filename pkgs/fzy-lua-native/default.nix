{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "fzy-lua-native";
  version = "unstable-2023-06-08";

  src = fetchFromGitHub {
    owner = "romgrk";
    repo = "fzy-lua-native";
    rev = "820f745b7c442176bcc243e8f38ef4b985febfaf";
    sha256 = "1zhrql0ym0l24jvdjbz6qsf6j896cklazgksssa384gfd8s33bi5";
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
