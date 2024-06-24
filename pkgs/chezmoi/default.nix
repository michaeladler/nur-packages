{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-06-23";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "b4b55659c69fb13a502903c16dcdd566b988eece"; # tags/*
    sha256 = "159dmcbzpy8xwsh5pq47s2s37j8bla9b70zq7hajbhvsqlnsbf0f";
  };

  vendorHash = "sha256-3nufF280WuDNvhKn9xP9dnxNX2VC59nifuJp+ebUSvk=";

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
