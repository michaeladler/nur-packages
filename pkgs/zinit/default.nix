final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-04-10";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "cbb4a880ae1fae86def016e68d783c02f1a00dab";
    sha256 = "1h5hr8m0imfjzyydc57ayk5jx7ia2m9bk90d9pmh9crrqrq932zl";
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
