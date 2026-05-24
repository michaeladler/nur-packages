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
  version = "0-unstable-2026-05-23";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "4c6d9147c46384e61652f4cb6c8f0c695f017bfc";
    hash = "sha256-C8ns53qLpBdb5osdX68UBGMqM2Rs5UJyfal/iDns6a4=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-gDkXAiW8ajEpsEBb7KT9MO5fPEWyUqS+2ak34cipPdc=";

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
