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
  version = "0-unstable-2026-05-24";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "39583cf22b0a73ef78f935d8ada1c87a9a10e852";
    hash = "sha256-ZCDVS/AFljljMac+cAzQztYPQgvQrcEhKIHHRhkMsv8=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-CFhKBzJc2/+gZDfHq7wxBWEbtHV8EF3OYa+t1b9aL8k=";

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
