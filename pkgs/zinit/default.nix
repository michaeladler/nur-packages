final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-08-15";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "68a6b42caf224b2ca2c172d58daf9faf5c86beb9";
    sha256 = "1rcgrbp9ipi907crh04vbd3kbg85sjivqwja3bscxf619j2mxsyk";
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
