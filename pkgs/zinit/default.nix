final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-08-02";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "1375adf8f8edadbdcfc18445d852c7f08e723887";
    sha256 = "0jyzdlfrv3r0qpl7zq3dgck805qa5qgkarjfym3l4cs0kk8iz415";
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
