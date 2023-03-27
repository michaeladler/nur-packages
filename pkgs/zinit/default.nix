final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-03-26";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "c624ac00770f7284bc851bea377eedcc974792f4";
    sha256 = "0g9blx0pbmnmfn3rrldfkfq9l7k42qp06g7x49vjd291pdkhhcj7";
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
