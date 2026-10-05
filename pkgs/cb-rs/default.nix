{
  lib,
  rustPlatform,
  fetchFromGitHub,
  installShellFiles,
}:

rustPlatform.buildRustPackage {
  pname = "cb-rs";
  version = "0.1.0-unstable-2026-10-04";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "cb-rs";
    rev = "40ac62ce4412af7595b75749fd32eddd68536b26";
    sha256 = "sha256-pw3QtVrhu8TmeDizBgMzcBNzCHpCoMD8ZvWb56n+wVQ=";
  };

  cargoHash = "sha256-SHXsXNU83i0EX9QJ4RqUgswgiOaqsI+E32LEK2fp0IU=";

  nativeBuildInputs = [
    installShellFiles
  ];

  postInstall = ''
    installManPage man/cb.1

    installShellCompletion \
      --bash completions/cb.bash \
      --fish completions/cb.fish \
      --zsh completions/_cb

    # Elvish and PowerShell (optional manual install):
    install -Dm644 completions/cb.elv $out/share/elvish/lib/cb.elv
    install -Dm644 completions/_cb.ps1 $out/share/powershell/Modules/cb/_cb.ps1
  '';

  meta = {
    description = "a cut/copy/paste tool for the command line";
    homepage = "https://github.com/michaeladler/cb-rs";
    license = lib.licenses.asl20;
  };
}
