final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-09-18";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "4a2a120b341793b1abaef5f12fbb4808277d8570";
    sha256 = "0k8fnwmq6scvzxn2gi52yv3srg1d5ha41pq0qm02skzk4cabcaar";
  };

  installPhase = ''
    cd "$src"

    outdir="$out/share/$pname"
    mkdir -p "$outdir"

    cp *.zsh "$outdir"
    cp -R share "$outdir"

    installShellCompletion --zsh _zinit
    installManPage doc/*.1
  '';

})
