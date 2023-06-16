final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-06-15";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "1cb1df630787a28234e6310bd66fe8aa7f432663";
    sha256 = "060iwbgbx69z9jvp4sgzhfddkbmnqvgd2f105h2b3kva153d8r33";
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
