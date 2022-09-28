final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-09-28";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "5be3b2a72e3606ae00ebe2dd55ab0cc9309eecfa";
    sha256 = "1pcnifwvgnsx1dmdlprhvxjjqg6hac1hv1wbrz37yipqg1880f6i";
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
