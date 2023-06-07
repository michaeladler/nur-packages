final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-06-05";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "9ebc788632f635f81748b7aeb3901779a3101f1a";
    sha256 = "1n9dr6mcs4pgcz27f8a1jds23cwqy3gsv79mhfbj0zwqak31yv3j";
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
