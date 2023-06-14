final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-06-13";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "5706971e9061175a915fa94fe31e9e4bfe901b68";
    sha256 = "19pqfvyflq27i8nrrhwvphyg3dl8hpvsazhq1lgkfr5yl4rv9fbn";
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
