{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-05-12";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "4ad03d7a6ff4d4aafeb65efbfa47c1529238c302"; # tags/*
    sha256 = "0z6ab7qhbwp13ginq1fkjg4wlvh2zvks5gg3jk1x9v9crm5j0vmz";
  };

  vendorHash = "sha256-8KcseMkYww+Ccaw+ovwXhakO9ira2TRI4uQ5TbCZcSE=";

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
