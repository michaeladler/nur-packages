final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-11-30";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "cfd32618921ce0626a6deadc794da962750a845d";
    sha256 = "1pnizi28cdvv437gkfn29kvpibirhrn850ykipg2w8dx72fgrcp0";
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
