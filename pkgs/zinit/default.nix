final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-04-15";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "db404aa8efb564531501a98288b7ee2d5d25c0b2";
    sha256 = "1rkzmsibffid77f9whbrv856dzcac1xm0iixzlfn5s9vjfnv5zfn";
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
