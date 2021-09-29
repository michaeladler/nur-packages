{ stdenv
, lib
, naersk-lib
, fetchFromGitHub
, installShellFiles
}:

let gitCliff = naersk-lib.buildPackage {
  pname = "git-cliff";
  version = "unstable-2021-09-28";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = "git-cliff";
    rev = "2950a412c2aaa0d96609753129047cef39fd3e1c";
    sha256 = "1yh6apbxpjkj3ppgrgs3rczr7fp2qib3fg2v95vmgdmmzwp8fllp";
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
