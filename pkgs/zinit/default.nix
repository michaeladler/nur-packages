final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-04-02";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "6845b7a91e3d22b039ce23f30ac9fc505455f786";
    sha256 = "0xiqhidkqyk5nb51xmn66izw20paqwbkr7dxq9g6205sy1aazq8b";
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
