final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-02-16";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "e3ccd7f7a46259382d2ea7738fd2697f2c5ccaa4";
    sha256 = "0qaf3j6xgz5vy62vbiwsp2jh5qdj7yv27h2kckhb2n54zv4ps08z";
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
