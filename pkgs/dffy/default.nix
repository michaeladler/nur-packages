{
  lib,
  rustPlatform,
  fetchFromGitHub,
  git,
  nix-update-script,
}:

rustPlatform.buildRustPackage {
  pname = "dffy";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "amalucelli";
    repo = "dffy";
    rev = "5dfc1cc6df9302e32667248a2e87a5c6bddaf199";
    hash = "sha256-iem0lCBjxr38TvjUD/qvmC0ufy6q1csjsguUBq621ew=";
  };

  cargoHash = "sha256-GqJJTFXV5ICL7UPQjgIPioL8x1kZf2PB3lYb80UtfY0=";

  cargoBuildFlags = [
    "-p"
    "dffy"
  ];
  cargoTestFlags = [
    "-p"
    "dffy"
  ];
  cargoInstallFlags = [
    "--path"
    "crates/dffy"
  ];

  nativeCheckInputs = [ git ];

  doCheck = false;

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=stable"
    ];
  };

  meta = {
    description = "Fast terminal diff viewer for git";
    homepage = "https://github.com/amalucelli/dffy";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ michaeladler ];
    mainProgram = "dffy";
  };
}
