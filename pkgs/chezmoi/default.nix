{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-08-15";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "7f44957f0bbcdea196c2a6b0547f50d7aac6d7eb"; # tags/*
    sha256 = "0bc2bfqv4n7wkq2l3vv0246d68b6vnchib8fr36y8p0ps7gdj82i";
  };

  vendorHash = "sha256-xof2uSVUzWPlMhWU7p9/dlbHnr2/Keu7JpUUvuTB2dM=";

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
