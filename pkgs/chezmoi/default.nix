{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-02-25";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "39bd915f446068862cc3064edb6dbeee795785ca"; # tags/*
    sha256 = "1q466f5zdmdng9kby7axcm9gamsqs3xprlxq27qymzr7bs58i5cr";
  };

  vendorHash = "sha256-ZGGmNDY84LNikSiqWMpCQQj3/pCWRPjc0xDk2ZZ2nIY=";

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
