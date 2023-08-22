final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-08-21";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "5568128706848740c54ceab58911b4d2f9700363";
    sha256 = "0j1plalm808vakyvq08al1xjnrmgi17dqlkpvx5jxn9wcl19sqw5";
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
