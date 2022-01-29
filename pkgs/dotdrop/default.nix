{ stdenv, lib, callPackage, fetchFromGitHub, python3Packages, installShellFiles, file }:

let
  buildPythonPackage = python3Packages;
  fetchPypi = python3Packages.fetchPypi;
in
python3Packages.buildPythonPackage rec {
  pname = "dotdrop";
  version = "unstable-2022-01-28"; # tags/v*

  src = fetchFromGitHub {
    owner = "deadc0de6";
    repo = "dotdrop";
    rev = "39d4bd23ab94210f384025cb79f7df835a284dbe";
    sha256 = "0rf2jmpkkxhqhi4wc8hwnklrwivzjmbmibsidy0735iiy67p10hx";
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
