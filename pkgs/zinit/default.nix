final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-11-01";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "9987d5c781d4a95698ed649dc59b11c34006b1c1";
    sha256 = "0m2vhdbh8368sr65amk232f26zl9hczhgy1k1yxgwlpa888xvb1g";
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
