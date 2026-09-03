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
  version = "latest-unstable-2026-09-02";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "34fe2553192aef5f6ca19944cb52a272a5294c27";
    hash = "sha256-qYVkFLS6G4Tf1NmD9B3kJkyb47XREoVE65EqBtbzzjs=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-2lwLPia3v7xagKsrCpayixZMmOqX15qrjsVP8/RQCXE=";

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
