final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-10-03";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "7f6dc7da6c824b30c0e8e30ae0ecbda5be118e68";
    sha256 = "043hl7dsyj5ih9kif3q7cbs6g39m7nnz80nd9dv39dwwdc4x9a1h";
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
