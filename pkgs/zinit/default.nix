final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-04-19";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "6d84f9991d71b08732579bb43c4d02840a9a395e";
    sha256 = "18dm85sa4f6sw08ipqzcyyraxlnjpx8kvf8fw1m8qp6n85s61gnb";
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
