{
  lib,
  rustPlatform,
  fetchFromGitHub,
  nix-update-script,
}:

rustPlatform.buildRustPackage {
  pname = "bend2-lsp";
  version = "0.7.1";

  src = fetchFromGitHub {
    owner = "IlyaGulya";
    repo = "bend2-lsp-rs";
    rev = "d7a95ef20bee5da1cbc3863fb1714054c146ba3e";
    hash = "sha256-7cWrfcc9eL6FPUnbfBBzw+egJNJ+ARqFL+rZ+jC9Jqw=";
  };

  cargoHash = "sha256-Gz8PZkyyC/t1FH4Zk2XYRc0cI+EG5wO2zmcziFzuERk=";

  # Upstream integration tests require a separately provisioned Bend compiler.
  doCheck = false;

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=stable"
    ];
  };

  meta = {
    description = "Language server for Bend 2";
    homepage = "https://github.com/IlyaGulya/bend2-lsp-rs";
    license = lib.licenses.asl20;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ michaeladler ];
    mainProgram = "bend2-lsp";
  };
}
