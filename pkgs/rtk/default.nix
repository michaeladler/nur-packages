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
  version = "latest-unstable-2026-06-05";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "de78d70aee86fe6b7b5c2462820a1b6c250d425b";
    hash = "sha256-UWiu6y3Ci5F5OYQZIB0QuFmgv+tRUTouD9RZfX+PcsA=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-ryOxbRwtkmeVnV/oF33eAZu/WileUd18ucgdsOvb5QU=";

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
