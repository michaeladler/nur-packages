final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-09-29";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "65331c222db7858d6a834b21023fe98c51180e97";
    sha256 = "18wi9r0mvvl8jy8aw8qy0cv0h9ndj086x462vhrbgiibixwx64ca";
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
