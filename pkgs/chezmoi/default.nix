{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-01-01";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "a450748cf0f672dd09cdf933c21de4e2049e45de"; # tags/*
    sha256 = "12x3xvib8lirnqhj1nfdzcjrhrjmz5296lbf1pkzbi5pqzbfpkxr";
  };

  vendorHash = "sha256-f65e6IyXU4muJLicx5eI3INci0pXVOYdfEh6IZvmYOc=";

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
