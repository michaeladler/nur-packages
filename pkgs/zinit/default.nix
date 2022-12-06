final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-12-05";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "59975d70d7101651b0bb01f4e22c23db0dae8133";
    sha256 = "062x89vacjm9yi16svbdk95yp3b8fhzv0hbpczxbsqq8i08hh572";
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
