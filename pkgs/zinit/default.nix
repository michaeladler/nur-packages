final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-02-12";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "c90f2c37bf60e0d7ca41b03fb1d1be46e1793c60";
    sha256 = "1558kdda45jxn0b2lbrmdxw68n2jlawl7r6abyizdjbapz766cbf";
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
