{ stdenvNoCC, lib, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "zsh-fast-syntax-highlighting";
  version = "2021-05-14";

  src = fetchFromGitHub {
    owner = "zdharma";
    repo = "fast-syntax-highlighting";
    rev = "817916dfa907d179f0d46d8de355e883cf67bd97";
    sha256 = "0m102makrfz1ibxq8rx77nngjyhdqrm8hsrr9342zzhq1nf4wxxc";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    plugindir="$out/share/zsh/site-functions"

    mkdir -p "$plugindir"
    cp -r -- {,_,-,.}fast-* *chroma themes "$plugindir"/
  '';

  meta = with lib; {
    description = "Syntax-highlighting for Zshell";
    homepage = "https://github.com/zdharma/fast-syntax-highlighting";
    license = licenses.bsd3;
    platforms = platforms.unix;
  };
}
