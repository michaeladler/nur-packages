final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2023-03-10";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "8e3d2eefbd6ed415b0f0fee8d4f534c71224a03b";
    sha256 = "0zchksj7xwdpqikvwj3w7igqzdmqahzqghhv97g35b5q9dnzrv81";
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
