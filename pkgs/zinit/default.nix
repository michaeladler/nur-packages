final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-01-14";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "b72146194799d1bf3a9087f1c4be14d35bf29bfe";
    sha256 = "117fqyixa1vqh4gmlr7i1y352drvxvnvhs0yvd28vvmz5m5a88nm";
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
