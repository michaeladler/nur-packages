final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-11-07";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "a27d7e0b572384e961fe3fc7c3eb740b54a8c6f9";
    sha256 = "17mazd3p0b1srkl6px7lx1jrqk7zw8v23ikwvq0rnphbpk11qrf8";
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
