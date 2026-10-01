{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage {
  pname = "cargo-clean-all";
  version = "0.6.5";

  src = fetchFromGitHub {
    owner = "dnlmlr";
    repo = "cargo-clean-all";
    rev = "f4660ceee200dd086e797a71a3aa71aaa6b58676";
    sha256 = "0yj3svfarbvix223j8ch8c4y5vqzcnszk9id539rw0ilz31y7708";
  };

  cargoHash = "sha256-9Qv2/XacE82AtZCZS5vtSeVdnD6Ugs+Qn/EVevMndQM=";

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=stable"
    ];
  };

  meta = {
    description = "Fast recursive detection and cleaning of rust projects with interactive TUI and filters";
    homepage = "https://github.com/dnlmlr/cargo-clean-all";
    license = lib.licenses.mit;
  };
}
