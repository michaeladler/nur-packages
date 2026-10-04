{
  lib,
  rustPlatform,
  fetchFromGitHub,
  installShellFiles,
}:

rustPlatform.buildRustPackage {
  pname = "cb-rs";
  version = "0-unstable-2026-10-03";

  src = fetchFromGitHub {
    owner = "michaeladler";
    repo = "cb-rs";
    rev = "3fddcc78c91ac931270219313eb5d74c88a86049";
    sha256 = "sha256-dSeEWJA2JJ3ymopN2FVMVChSmt5sKz0TEyDBl1TFcNc=";
  };

  cargoHash = "sha256-0CBW0qeZ/k9/V7GYU8mfQQJxxhbaNWnP3C9Am277dSY=";

  nativeBuildInputs = [
    installShellFiles
  ];

  postInstall = ''
    $out/bin/cb man > cb.1
    installManPage cb.1

    installShellCompletion --cmd cb \
      --bash <($out/bin/cb completions bash) \
      --fish <($out/bin/cb completions fish) \
      --zsh <($out/bin/cb completions zsh)
  '';

  meta = {
    description = "a cut/copy/paste tool for the command line";
    homepage = "https://github.com/michaeladler/cb-rs";
    license = lib.licenses.asl20;
  };
}
