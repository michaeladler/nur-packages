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
    rev = "ea4df2be2112f70b0a69669226262233246d212a";
    sha256 = "0w1yc0v5s84vaaszv6y3z6v1fi3kxahr6xyb6qh3wnpignabk4d0";
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
  version = "0.2.0-unstable-2026-10-23";
  __intentionallyOverridingVersion = true;
})
