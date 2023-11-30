{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2023-11-29";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "0b38793c15f3fe4785a58b6df9796d1a6cf8c79d"; # tags/*
    sha256 = "1i0b6wf3f1sk2klvikchmxqrhai39ndblnf458nwchy8c5h8l98s";
  };

  vendorHash = "sha256-/yhU6IJw0M3Jy90E2u6kVppgf09auG9IjOnlenAHyiw=";

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
