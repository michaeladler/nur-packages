final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-04-14";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "034e265ede7f94677dd4e93e7c389823a74d9f2c";
    sha256 = "193bhnba8cbaklq9whjrf6mj59vxpwgm7in6xp9qnspvcklmhg58";
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
