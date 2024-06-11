{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-06-10";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "2e0573779db0c42717585ac8abc4ad1ab814dfb2"; # tags/*
    sha256 = "0qjc5hdapc6r2wkf9s8l26ahcd0zfn0pvfnv5x3zlvbkc9whslzm";
  };

  vendorHash = "sha256-0gM2C8vXFOFDNJVnjq0Qbm2urhenWcH8F+ExAtjMVc0=";

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
