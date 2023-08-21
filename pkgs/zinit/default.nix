final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-08-20";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "14cc16167fb019033872600339d74d6039816b88";
    sha256 = "01i9qn437a8rk7a8jy5cxvcxcl485yyiaklg1vsi0qaj4ljfb1gp";
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
