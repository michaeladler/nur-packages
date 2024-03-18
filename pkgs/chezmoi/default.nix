{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-03-17";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "f4904293d9e3d5297f481b0b1ec00981716fff39"; # tags/*
    sha256 = "1qizfns5m7rgkv08prn5ihvlr1dh889ds6ycmcbc0nb86lwxwcsy";
  };

  vendorHash = "sha256-ZtxX8BTX+7SfRxdxNWAy3wNTl8H7yoBNJr99dzCA+uk=";

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
