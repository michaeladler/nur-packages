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
  version = "0-unstable-2026-05-22";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "9c943d60186aed0023142b4db771b5742e9350cf";
    hash = "sha256-NruV2+N9IraBmoP4LcpCDqvBVvrhuPOEBQlVBGKCyws=";
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
