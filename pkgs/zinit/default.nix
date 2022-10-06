final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-10-05";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "be1533552afc9f7a478763e5645fa82e86536f89";
    sha256 = "08wc3la6hsi7hqg9qmkzlgwl7fz7ggfd86g6n0cc381wqwkz4q9l";
  };

  installPhase = ''
    cd "$src"

    outdir="$out/share/$pname"
    mkdir -p "$outdir"

    cp *.zsh "$outdir"
    cp -R share "$outdir"

    mkdir -p $out/share/zinit/doc
    cp doc/*.1 $out/share/zinit/doc/

    installShellCompletion --zsh _zinit
    installManPage doc/*.1
  '';

})
