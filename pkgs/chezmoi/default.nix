{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2023-11-26";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "694977b904e888ba285aa0fd44617d1d59d89bc7"; # tags/*
    sha256 = "1xqci4vrg0j1gfxn0pz3p3fd2cxdr10ml03x5a8419kdpc4izviy";
  };

  vendorHash = "sha256-/yhU6IJw0M3Jy90E2u6kVppgf09auG9IjOnlenAHyiw=";

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
