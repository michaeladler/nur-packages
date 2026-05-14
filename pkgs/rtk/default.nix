{
  lib,
  rustPlatform,
  fetchFromGitHub,
  makeWrapper,
  pkg-config,
  sqlite,
  gitMinimal,
  writableTmpDirAsHomeHook,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "rtk";
  version = "0-unstable-2026-05-13";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "1e0d01b68e18fd89b4d968f4b9b23f0ef20dd779";
    hash = "sha256-xWHIOZRpSyyOPQe/db9dxoODcnheBlpXrnKET010vVg=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-DJazpSx1FCt9pjFjqsoL3MLEQLdFvLwEj3UsP0aYHmc=";

  nativeBuildInputs = [
    makeWrapper
    pkg-config
  ];

  buildInputs = [
    sqlite
  ];

  postInstall = ''
    wrapProgram $out/bin/rtk \
      --prefix PATH : ${
        lib.makeBinPath [
          gitMinimal
        ]
      }
  '';

  nativeCheckInputs = [
    gitMinimal
    writableTmpDirAsHomeHook
  ];

  doInstallCheck = true;

  meta = {
    description = "CLI proxy that reduces LLM token consumption by 60-90% on common dev commands";
    homepage = "https://github.com/rtk-ai/rtk";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ GaetanLepage ];
    mainProgram = "rtk";
  };
})
