{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-05-31";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "80d7918630f17a5a0827ffb218e16dbb596f3bac"; # tags/*
    sha256 = "0ldkxyrx4jmliddqs5x7is5jkljmxs59da36ca8l1nbvybq6jk12";
  };

  vendorHash = "sha256-151l+yen1QI5DiYJgBvWV/OlbnE72ecmMtHUBRhxQM4=";

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
