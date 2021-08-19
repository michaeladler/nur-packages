{ stdenv
, lib
, naersk-lib
, fetchFromGitHub
, installShellFiles
}:

let gitCliff = naersk-lib.buildPackage {
  pname = "git-cliff";
  version = "unstable-2021-08-19";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = "git-cliff";
    rev = "e6fe05b2da8b65122a5f9b021e7e3aaa4b5e5956";
    sha256 = "10y15cpmrpw478bh7lkgyf3gi4qs7chmf37dx7h857z5dxgip0pc";
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
