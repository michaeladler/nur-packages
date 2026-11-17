{
  lib,
  craneLib,
  fetchFromGitHub,
  installShellFiles,
  nix-update-script,
}:

(craneLib.buildPackage rec {
  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "cb-rs";
    rev = "05aa5ff43b88c39e8fcddb8e6ab8e2af95616755";
    sha256 = "sha256-gEXsxi47UQ5me8MmVCwe98w6xWDVtZHFQbnnSWaxnxE=";
  };

  cargoArtifacts = craneLib.buildDepsOnly {
    inherit src;
    strictDeps = true;
  };

  nativeBuildInputs = [
    installShellFiles
  ];

  postInstall = ''
    installManPage share/man/cb.1
    installShellCompletion \
      --bash share/completions/cb.bash \
      --fish share/completions/cb.fish \
      --zsh  share/completions/_cb
  '';

  # cachix needs cargoArtifacts pushed separately: buildDepsOnly output is a
  # build-time input, so it is not part of the package's runtime closure.
  passthru.cargoArtifacts = cargoArtifacts;

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=branch"
    ];
  };

  meta = {
    description = "a cut/copy/paste tool for the command line";
    homepage = "https://github.com/michaeladler/cb-rs";
    license = lib.licenses.asl20;
  };

}).overrideAttrs
  (_: {
    # Expose Cargo version in this flake for nix-update.
    version = "0.2.0-unstable-2026-11-13";
    __intentionallyOverridingVersion = true;
  })
