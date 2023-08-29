final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-08-28";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "b456a2dba65673f4cf5a9a8c2bc16d7d0dcb3ace";
    sha256 = "1zrh6plj2zlsa5x2isz7c9v3js01hs5c6m2s1mrdlbfrdkxv9yl4";
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
