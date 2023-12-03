{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2023-12-02";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "ea1e143fe416097792706a708144ffda0d85b268"; # tags/*
    sha256 = "0qc5iia1zpgp332439src5hmdhw9q04f5q8cprhx902znr1jk915";
  };

  vendorHash = "sha256-Cn8Upc4kvsuvAQWLYuUawWGg8o/9HYd4U7texs4ulD8=";

  doCheck = false;

  ldflags = [
    "-s" "-w" "-X main.builtBy=nixpkgs"
  ];

  nativeBuildInputs = [ installShellFiles ];

  postInstall = ''
    installShellCompletion --bash --name chezmoi.bash completions/chezmoi-completion.bash
    installShellCompletion --fish completions/chezmoi.fish
    installShellCompletion --zsh completions/chezmoi.zsh
  '';

  subPackages = [ "." ];

  meta = with lib; {
    homepage = "https://www.chezmoi.io/";
    description = "Manage your dotfiles across multiple machines, securely";
    license = licenses.mit;
  };
}
