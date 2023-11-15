{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2023-11-14";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "4a5f006fede66f8e2b9213bfe872244eb2b2cfd8"; # tags/*
    sha256 = "1a8pvxgb3xvaxa9dr8vzmzz0wk44dza3sq0vrc71zhjajd5b6lip";
  };

  vendorHash = "sha256-SoSRSKG7tb09hFu2KZBKtA3/6YY9xbI0dKlCHMwytdI=";

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
