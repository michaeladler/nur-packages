{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2024-07-15";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "2a7845f4ffe2fd427c140711c0d7d46424747363"; # tags/*
    sha256 = "1zzk1a7d4vbc1fbfvsgjy57jld9x5c2jzv4nxfvip8w2c01bbk6p";
  };

  vendorHash = "sha256-wWvvNc7W+7/Hwy4/hwCyY0k/Qm5M7Z6PPCa9DXbXY0E=";

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
