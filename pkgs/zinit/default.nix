final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-01-13";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "5ef0bc56132a0ed5ddd5526da10bce035bcc2296";
    sha256 = "0si956fwd7k1m69i9hkbicqx62pdd8vdlcc2hsfbkh4v4bdvamx5";
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
