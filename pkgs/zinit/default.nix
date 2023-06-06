final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-06-05";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "de85908f8d0b89ff6327adfa285ca5a0c4302f2d";
    sha256 = "175qq6cil74rfmprh19pldhazwzlbacal4bm880rbqyqvksw6mwz";
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
