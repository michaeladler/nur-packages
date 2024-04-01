{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-03-31";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "4f76edb5295068569d7c6311020ac0094c77ef44"; # tags/*
    sha256 = "1lcqwh66lsm0zs1sg71zbblld1brcnf152dda3hqhmqssri5glv7";
  };

  vendorHash = "sha256-IbNEKj8wJpsQO9bXrsH4OJUIhez9merFSWydhSHbvRQ=";

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
