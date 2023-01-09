final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-01-08";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "52e112c7c307cea2eaf080e79b4ef57281506bdf";
    sha256 = "04ayl9y1rm27xfj64hnw3l2nyss9vgr3grr0nf4ribmsnrkacc17";
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
