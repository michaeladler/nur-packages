final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-03-29";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "0bdf9eaf56914ae5175ec8c2344cde4d392702fb";
    sha256 = "1s03n4m07m63c9qj68p1gxbxs7a4j6pjpzkccn00a24bj7g587zd";
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
