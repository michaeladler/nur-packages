{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages, installShellFiles, file }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;
in
python3Packages.buildPythonPackage rec {
  pname = "dotdrop";
  version = "unstable-2022-06-25";

  src = fetchFromGitHub {
    owner = "deadc0de6";
    repo = "dotdrop";
    rev = "7ada65921b4fd9f203ddd8f4b7a77b9c72bfeb01"; # tags/v*
    sha256 = "1xkq4w6mpflx1gl0cywpgwask36lgi5i8d88xmqqzwyh4pg1f2w2";
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
