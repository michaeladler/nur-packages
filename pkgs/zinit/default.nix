final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-10-30";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "1d9e05fb1e0c5b1fd6545a6f5baaeaa3cd11fbf1";
    sha256 = "0ssm3jcygsnz3hi72fk20l57cqmk5hdhaks7vlyf3xsjvmiidxrs";
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
