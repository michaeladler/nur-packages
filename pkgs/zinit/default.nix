final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-11-20";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "0c1839a18b634cbc8ee2baebb47d7487bef04710";
    sha256 = "1klhfzj2zlwd2f8y6nyn0bw4g6ykhqgjq2k2d8lnq1anpffjlbai";
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
