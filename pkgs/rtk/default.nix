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
  version = "0-unstable-2026-05-06";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "2fbc7514f6964acabcfac65501b8bb6b525e3aa8";
    hash = "sha256-TX4MtR/rq61wxHWYJAO2x3CYvZtkCoXynf45dRC+MVo=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-s3AtUftUZtzhlep8R/ZuxwmGELIZpqbQXqLTD+aS4Ro=";

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
