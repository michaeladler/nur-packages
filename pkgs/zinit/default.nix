final: prev:

prev.zinit.overrideAttrs (old: {
  version = "unstable-2022-09-27";

  src = prev.fetchFromGitHub {
    owner = "zdharma-continuum";
    repo = "zinit";
    rev = "061a85c4ff7d950f0f852dacaf40010d9651fb43";
    sha256 = "0amdcz7xczh942zrd8f5jkqqadga2xk0yrij82sd4n3r8yaxfi1q";
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
