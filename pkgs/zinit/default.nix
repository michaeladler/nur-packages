final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-09-12";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "8ed4e96deabd0e8e13ef1a837e6b9e16679cd0ac";
    sha256 = "0fnp891xwi83y83vfmyxrx6qkv5z5sw1jf5lji5yrqa37gimsysw";
  };

  installPhase = ''
    cd "$src"

    outdir="$out/share/$pname"
    mkdir -p "$outdir"

    cp *.zsh "$outdir"
    cp -R share "$outdir"

    installShellCompletion --zsh _zinit
    installManPage doc/*.1
  '';

})
