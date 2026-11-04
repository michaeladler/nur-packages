{
  lib,
  craneLib,
  fetchFromGitHub,
  installShellFiles,
}:

(craneLib.buildPackage rec {
  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "cb-rs";
    rev = "b84135d7abd36306917de8a013145a00c29fdf67";
    sha256 = "sha256-Y9of7ilupCE8YcTYxix2K3H0Eyss3UXrTowekCqMeko=";
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

  meta = {
    description = "a cut/copy/paste tool for the command line";
    homepage = "https://github.com/michaeladler/cb-rs";
    license = lib.licenses.asl20;
  };

}).overrideAttrs (_: {
  # Expose Cargo version in this flake for nix-update.
  version = "0.2.0-unstable-2026-11-04";
  __intentionallyOverridingVersion = true;
})
