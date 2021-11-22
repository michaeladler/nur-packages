{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages, installShellFiles }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;
in
python3Packages.buildPythonPackage rec {
  pname = "dotdrop";
  version = "unstable-2021-11-21";

  src = fetchFromGitHub {
    owner = "deadc0de6";
    repo = "dotdrop";
    rev = "6722dcb7185c5d11366baf9ec84a558a8ec6b25d";
    sha256 = "00bsqmgzmhwbfb79dzvmw29f986h07pkwcvr4csjlnp3zdx5fw19";
  };

  nativeBuildInputs = [ installShellFiles ];

  propagatedBuildInputs = with python3Packages;
    [
      jinja2
      docopt
      ruamel-yaml
      python_magic
      packaging
      requests
    ];

  doCheck = false;

  postInstall = ''
    installShellCompletion --zsh --name _dotdrop $src/completion/_dotdrop-completion.zsh
    installShellCompletion --bash --name dotdrop.bash $src/completion/dotdrop-completion.bash
    installShellCompletion --fish --name dotdrop.fish $src/completion/dotdrop.fish
  '';

  meta = with lib; {
    homepage = "https://github.com/deadc0de6/dotdrop";
    description = "";
    license = licenses.gpl3Plus;
  };
}
