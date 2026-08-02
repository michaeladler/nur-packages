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
  version = "latest-unstable-2026-08-01";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "700bdde3343299ea06bbca18dc6670a80c88b289";
    hash = "sha256-qOWWHov0m3A8V48r/UGN2Hxz+/XraPRYhNPnZ+B+ZBY=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-1nuCXZZjGDyA8kN6pFPclx8sIdD6QbGZDlTtyl+6Gow=";

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
