final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-08-06";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "c3d1bb586c77a98566c552358fd9aee084e30da8";
    sha256 = "1h4a721gpjw1ji9rf6ihqwvsvraymz50yk048n2ga8h9h3w8b5ay";
  };

  installPhase = ''
    cd "$src"

    outdir="$out/share/$pname"
    mkdir -p "$outdir"

    cp *.zsh "$outdir"
    cp -R share "$outdir"

    installShellCompletion --zsh _zinit
    installManPage doc/*.1
  '';

})
