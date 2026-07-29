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
  version = "latest-unstable-2026-07-28";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "36591fb00d650bf987b57483c0b3a395a35a8dc1";
    hash = "sha256-5AN/sK0IOIqcLX0FviFPOJ9QX9xJpliSN1XY3isxyrA=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-Hd8dy0atCeTie2rZ3nfpbwbTHrIueNlXo7kpmK6QQNU=";

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
