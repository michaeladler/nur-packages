final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-10-30";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "fad444b55b2df3c19061d5f31f7299327e1ec239";
    sha256 = "0rj15n0fvkqi8hpgq4i6k88qn77v4c2yizyddzg0gnm60llk3cd7";
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
