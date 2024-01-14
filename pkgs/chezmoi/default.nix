{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-01-13";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "371703e93f0c54dad81f7cfbea2906ece15a7428"; # tags/*
    sha256 = "1ivabl3zq0k4y6rz8fqrd0amr9rfbc96w298zwv8mhcwx1pflpl7";
  };

  vendorHash = "sha256-NqCNP+oG8+x6vYaV9bDfn8+Q1nbxV3L3vs8L4iYgypU=";

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
