{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages, installShellFiles, file }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;
in
python3Packages.buildPythonPackage rec {
  pname = "dotdrop";
  version = "unstable-2022-05-31";

  src = fetchFromGitHub {
    owner = "deadc0de6";
    repo = "dotdrop";
    rev = "910482f8c8ba25234e0eb208419f39c06985aab3"; # tags/v*
    sha256 = "1m91aj07vajznhbhmchlvn6n9sq9wdv84v61x55cz60661dwc14b";
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
      toml
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
