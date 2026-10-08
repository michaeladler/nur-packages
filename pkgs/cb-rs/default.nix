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
    rev = "65be8de0ba62257f466c751ea16780d8b62a2e19";
    sha256 = "sha256-mg+UUZc7AXv/ARUwg3pAS1wYsjZ255pF5/yjfA4gPV0=";
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

  meta = {
    description = "a cut/copy/paste tool for the command line";
    homepage = "https://github.com/michaeladler/cb-rs";
    license = lib.licenses.asl20;
  };

}
