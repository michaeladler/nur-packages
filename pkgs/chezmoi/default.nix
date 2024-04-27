{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-04-26";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "c758a1c57fb6084631736a7dda5ac0aaeeffa946"; # tags/*
    sha256 = "1aradfkz4rr542vsc6b1viz8fd765mnbramz4cf5w0v6xvh5ijad";
  };

  vendorHash = "sha256-qoXfneNEAsvUgaEFHPF1bf/S8feFX+8HtwQy7nzy8Bo=";

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
