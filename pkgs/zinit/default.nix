final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-10-29";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "3885919788dd02e836034e9a6a2d4e5c7fc0ba08";
    sha256 = "1rwwn7n8g0avivgbslkjnwp0pk0cy61rprl54s44ql4bz08yxxll";
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
