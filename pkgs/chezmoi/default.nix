{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-04-12";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "d6ad485c86aa6501f5a7754ccba2a2b03d46c1a2"; # tags/*
    sha256 = "11wd008svn8hadd10pc2bmf6ngsm50fdn25gaj8bh9wfizymcn3j";
  };

  vendorHash = "sha256-8Puy1IKLMENduWyOAJtvpd7FV1a0IdmkMYztIJdeaBs=";

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
