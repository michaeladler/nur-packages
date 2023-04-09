final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-04-08";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "243f5bd6d2a4de394c3715e842bccd5d6a518f50";
    sha256 = "1ysdch0xsj81hs0lk9xs3479b652srl217fajhyd8qchyznzi4lg";
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
