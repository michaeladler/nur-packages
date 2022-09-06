final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-09-05";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "bf2a411ec66a4f560183055b0590c85247741aee";
    sha256 = "1vh5wba3ha5ckkwyijfzwng26yhmq5hl7y1q6c65cdmwmvh2xjmz";
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
