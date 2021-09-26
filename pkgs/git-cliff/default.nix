{ stdenv
, lib
, naersk-lib
, fetchFromGitHub
, installShellFiles
}:

let gitCliff = naersk-lib.buildPackage {
  pname = "git-cliff";
  version = "unstable-2021-09-25";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = "git-cliff";
    rev = "6bafc5d1a124dea5423338afd75a5136944bebb5";
    sha256 = "137zp5qqr2skcff877rc5vr6i5c8p9x6lv1bg9vnh68l3avs27i4";
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
