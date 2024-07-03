{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-07-02";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "3ad974381fe57aedbcffef4371aa80970a989aaf"; # tags/*
    sha256 = "0v07205cs0szy7fmcijapr7p6sfyf5x5l5fcdp7qfc1dybk3jmwp";
  };

  vendorHash = "sha256-5jc7i+vX6aGq//Zl924FIdjAVyqlusZfWRbc8aj3iLw=";

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
