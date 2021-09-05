{ stdenv
, lib
, naersk-lib
, fetchFromGitHub
, installShellFiles
}:

let gitCliff = naersk-lib.buildPackage {
  pname = "git-cliff";
  version = "unstable-2021-09-04";

  src = fetchFromGitHub {
    owner = "orhun";
    repo = "git-cliff";
    rev = "8fb18b784808222fdf3c4328ac9c871b93524fee";
    sha256 = "1c1br54xan8ylhr1qryc4mifdk493c85bbnkql6jp9dn1cv9ik9i";
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
