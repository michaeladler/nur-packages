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
  version = "latest-unstable-2026-07-26";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "3fc407027589acef9579df5b2ad10b0f3042e030";
    hash = "sha256-Ev6w0Gi2y48DYi55GSciCoPgkUFaX44aH3UWGhs1OGk=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-x+6bZZh0s3YPgav7S/4VrYxZBWAlX1BmvCFJHLmIjGM=";

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
