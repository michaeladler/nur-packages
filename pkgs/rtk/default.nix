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
  version = "latest-unstable-2026-06-03";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "f490ab7819de62dfeb53517861f34f9801d1d56d";
    hash = "sha256-zF48ymsWOqPHynS/Mx0oo7j7SSRygRdpcpkCsXYHZU0=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-j9HF624An09xbHd7dU20xTxNU/ztcLCRZ26yIaNWodk=";

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
