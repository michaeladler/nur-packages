final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-04-30";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "322253cd7b05d4466898ee095e9b50875519d36b";
    sha256 = "1cfr0wj9bykkf08na6rx5d26z014zi1ird0ighkyjk2bj59ksyi7";
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
