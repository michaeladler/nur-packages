{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-02-11";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "c65f66a5f1a990ffeb4d7e3f53320cb061f91513"; # tags/*
    sha256 = "09h59vrr7fz483ycyr7xaib2bc9bk4gcvnbxag0j7nadcf15ij24";
  };

  vendorHash = "sha256-C3aRKluMIZ6X7VHwC1xitG/gLJE8qcbbskxsgsXvzuA=";

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
