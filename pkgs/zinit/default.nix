final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-02-24";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "21c3b55d96571aab877632876017d0796d28018e";
    sha256 = "05fqcr8052ciyy7zg668n9kpaar6372a97r2wbq7m3gpv7mw8ir2";
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
