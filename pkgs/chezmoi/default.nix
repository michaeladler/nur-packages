{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-03-03";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "1ce6b2eeb0caf75bd91883e5a968e713a26e7be2"; # tags/*
    sha256 = "02iqwzh4mmy8xpq5p289dkxfzrw8sl90d78j31d1qnmkp0fx285h";
  };

  vendorHash = "sha256-gTgzuNsNzw8RmYaeOTBxkOc0Pt+WGLWTA6/oAL/1RRg=";

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
