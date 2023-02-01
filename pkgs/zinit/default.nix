final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-01-31";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "f214ebe4853dbfb9439b5c807df54b1e27b7d96c";
    sha256 = "00gvzj1q0ixaazz8a4kp0nj00xxhf80rv2a2cvmh30rxscbg6ppf";
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
