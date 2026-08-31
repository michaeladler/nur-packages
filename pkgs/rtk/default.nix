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
  version = "dev-0.47.0-rc.378-unstable-2026-08-26";

  src = fetchFromGitHub {
    owner = "rtk-ai";
    repo = "rtk";
    rev = "8dae5a750fe307d1fee105a2ff4a9d1ca54ac791";
    hash = "sha256-PwqRmOPe0RRbEQzVK7cvl2tM+p9YpVJqoI6LxSXWhx4=";
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
