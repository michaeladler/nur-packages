final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-02-21";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "3ade9bb250eddde5491392f667523d11ff042062";
    sha256 = "1qpdylyv2xmhdpsqmd4sbhv7db5frpa9nybhskxysk097322vx50";
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
