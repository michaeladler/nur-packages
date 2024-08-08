{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-08-07";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "64f40d93ea1f1456a6788798b9e9c4813156d86e"; # tags/*
    sha256 = "1w4mxd1z9r26f04lkn57aldcd0jibpb7pdlffx3hjbkpdwhca726";
  };

  vendorHash = "sha256-3RJk8Pf445lF2C7kQsj0eOXcFBWCHwLx8+GrqO7nAPM=";

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
