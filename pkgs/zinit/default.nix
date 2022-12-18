final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-12-17";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "b979847bd465e1bcd565c694daeac54d55e5f6cf";
    sha256 = "0m2yjik7rrcpv2hl4529g6l6b7mcd85s18n2ghl761d7g7bhvzx5";
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
