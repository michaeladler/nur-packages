{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-01-10";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "9902245adf529f5617dd1606a08f53f1fb1e8fa9"; # tags/*
    sha256 = "01xim6nppflm1rzkrdvf92b5j000yrmjliaybf95jsvvhqzy42gp";
  };

  vendorHash = "sha256-11ObhWiPgzlqszc7FftNQVwnq12xcq3to6lWsjpVLWc=";

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
