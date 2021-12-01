{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages, installShellFiles, file }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;
in
python3Packages.buildPythonPackage rec {
  pname = "dotdrop";
  version = "unstable-2021-11-27"; # tags/v*

  src = fetchFromGitHub {
    owner = "deadc0de6";
    repo = "dotdrop";
    rev = "56911eb6fd028bc3a9f86b670825e035c5c92200";
    sha256 = "1k1yrypn6yqd6nl0dvcxqmzjwakdfyzd6iz79arz6z7zxligb3lh";
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

  checkInputs = [ file python3Packages.pytestCheckHook ];

  doCheck = false; # does not work yet

  preCheck = ''
    export HOME=$(mktemp -d)
  '';

  postInstall = ''
    installShellCompletion --zsh --name _dotdrop $src/completion/_dotdrop-completion.zsh
    installShellCompletion --bash --name dotdrop.bash $src/completion/dotdrop-completion.bash
    installShellCompletion --fish --name dotdrop.fish $src/completion/dotdrop.fish
  '';

  meta = with lib; {
    homepage = "https://github.com/deadc0de6/dotdrop";
    description = "Save your dotfiles once, deploy them everywhere";
    license = licenses.gpl3Plus;
  };
}
