final: prev:

prev.zsh-fast-syntax-highlighting.overrideAttrs (old: {
  version = "2021-05-14";
  src = prev.fetchFromGitHub {
    owner = "zdharma";
    repo = "fast-syntax-highlighting";
    rev = "817916dfa907d179f0d46d8de355e883cf67bd97";
    sha256 = "0m102makrfz1ibxq8rx77nngjyhdqrm8hsrr9342zzhq1nf4wxxc";
  };

  # remove this once it has landed in nixpkgs
  installPhase = ''
    plugindir="$out/share/zsh/site-functions"

    mkdir -p "$plugindir"
    cp -r -- {,_,-,.}fast-* *chroma themes "$plugindir"/
  '';

})
