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
  version = "dev-0.47.0-rc.391-unstable-2026-09-01";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "bdaa79289eff16f4a6dc11ece067c0ff1a67d197";
    hash = "sha256-vbc+/ci+9zOoB9z1ZIozttbr67945jhwgPSPQ929mrY=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  cargoHash = "sha256-XP9o11YAU5VNkZXkZLd6bZeCetxzKV8Odoo6tfQlJhk=";

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
