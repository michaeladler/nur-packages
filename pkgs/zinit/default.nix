final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-05-04";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "879d889ee1fd8cfab5e05f6473763d1f22ffcff7";
    sha256 = "1pvi4f4faf7w56r6d7j9si2ax55vznd4hq9q7k84ia5adsrkp6qs";
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
