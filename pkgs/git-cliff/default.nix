{ stdenv
, lib
, naersk-lib
, fetchFromGitHub
, installShellFiles
}:

let gitCliff = naersk-lib.buildPackage {
  pname = "git-cliff";
  version = "unstable-2021-09-10";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = "git-cliff";
    rev = "ba3f1cac50338672c555581659e098e11796f466";
    sha256 = "0n75kl4dvi7mygyawaym14zdz2k6wk94gpx3ijqyz8dwqvpc4gy2";
  };

  meta = with lib; {
    description = "A highly customizable Changelog Generator that follows Conventional Commit specifications";
    homepage = "https://github.com/orhun/git-cliff";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
};
in

stdenv.mkDerivation {
  inherit (gitCliff) pname version src meta;

  phases = [ "buildPhase" "installPhase" ];

  nativeBuildInputs = [ installShellFiles ];

  buildPhase = ''
    mkdir -p completions
    env OUT_DIR=./completions ${gitCliff}/bin/git-cliff-completions
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -a ${gitCliff}/bin/git-cliff $out/bin/

    cd completions
    installShellCompletion --zsh --name _git-cliff _git-cliff
    installShellCompletion git-cliff.bash
    installShellCompletion git-cliff.fish
  '';

}
