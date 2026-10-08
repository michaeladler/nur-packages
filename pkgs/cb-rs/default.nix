{
  lib,
  craneLib,
  fetchFromGitHub,
  installShellFiles,
}:

craneLib.buildPackage rec {
  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "cb-rs";
    rev = "72ce654f2fee4c947cfbb3e8e9a95aff2a5b88bc";
    sha256 = "0jycii9g38wpbyb5cyhd2ccw2z0zdr68yfzfjgc91zrix8f95q75";
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

}
