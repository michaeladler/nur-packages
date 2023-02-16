final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-02-15";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "3ab1857b8a70d1b85a2a03f6296228203cb0ae0c";
    sha256 = "0nrrbaf13cbvf4845k3cbzggpfxgawidhcacplqp7x3xpcsygbhs";
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
