{ lib
, buildGoModule
, fetchFromGitHub
, installShellFiles
}:

buildGoModule rec {
  pname = "chezmoi";
  version = "unstable-2023-12-17";

  src = fetchFromGitHub {
    owner = "twpayne";
    repo = "chezmoi";
    rev = "43a4f5790ef1b709de881d36afb0a61745efa34f"; # tags/*
    sha256 = "0syq1wrqmp8xs41fndxp5njbwr1gcd83c6vv2nf2ikzh1jhz43qz";
  };

  vendorHash = "sha256-xBsjK2QCW5I9PGPNZWs3uuiBptV+EHSmAuUEWwvV/C0=";

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
