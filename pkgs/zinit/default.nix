final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-11-18";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "1e5c0e9389680b94c0505e06f45f72331d61f041";
    sha256 = "17mazd3p0b1srkl6px7lx1jrqk7zw8v23ikwvq0rnphbpk11qrf8";
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
