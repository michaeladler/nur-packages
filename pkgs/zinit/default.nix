final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-09-19";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "17fd453dc156606114174bd404c999a9c543faec";
    sha256 = "1y8555cj1pgnb12cj9wdlylg11dm38aazs5lw1d8njg7jx2j37p7";
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
