{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-01-25";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "1418f74ab40bbee807a1438ec0bbdb6c85f24a74"; # tags/*
    sha256 = "0n4a7172adirm99c93aiapdynynm9509cafaa8amhr1jql37lvq3";
  };

  vendorHash = "sha256-EGc4l02by6K0j0RZZ7YuGkpJ8UaZ4cYcxBd+ECHdwq4=";

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
