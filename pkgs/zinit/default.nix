final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-03-27";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "5d064741a053540edb855557c2aa6dd55e85b295";
    sha256 = "0gif45iydahyx53q8yyj38wfd3zxmqp358qgyhq0w6wk1ippmvd5";
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
