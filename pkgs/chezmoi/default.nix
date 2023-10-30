{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2023-10-29";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "97de3c9738828f6f5c2c282b9e8114142f07edb5"; # tags/*
    sha256 = "0qyzwa6fzvshs164jgs0g45agw46f2j60is4zhbkkwmwykc17liy";
  };

  vendorHash = "sha256-O9Ywq8LunS/0yBX9p9M2mzm+auvX1ynYaAY4EoBaE94=";

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
