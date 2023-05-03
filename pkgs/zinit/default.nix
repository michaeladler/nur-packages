final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-05-02";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "c4e6cb35f483aac47c72dff26e5d91b6dc234b1e";
    sha256 = "04sfhzsvvdlygh6bb1jds82cnkqkzdpya9gihy3pdxb90yqpp84i";
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
