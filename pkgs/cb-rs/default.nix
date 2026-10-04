{
  lib,
  rustPlatform,
  fetchFromGitHub,
  installShellFiles,
}:

rustPlatform.buildRustPackage {
  pname = "cb-rs";
  version = "0-unstable-2026-10-04";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "cb-rs";
    rev = "50d2385cd6468138ce2c9b9ce66682ae440d01f9";
    sha256 = "sha256-ZTfL3AycCRzUVWG56wxHYzgZnrjxg08FG2vHObmjygo=";
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
