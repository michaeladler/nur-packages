final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-06-08";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "497d519d99c3d3cdb8e71dfdf4583cadef9220a0";
    sha256 = "01clvc7f6w87nb8rxdc2kq68f94d64rs3n7wzzpp64q2n00b5d9x";
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
