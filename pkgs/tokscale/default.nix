{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  sqlite,
  nix-update-script,
}:

rustPlatform.buildRustPackage {
  pname = "tokscale";
  version = "0-unstable-2026-05-18";

  src = fetchFromGitHub {
    owner = "junhoyeo";
    repo = "tokscale";
    rev = "270d64c4d268d5bcc380690441d6a891687d6794";
    hash = "sha256-qgOGg3fZ4lHKMjNcWYDXkz/7FNNaUepBsiZ1vYy9Aqc=";
  };

  cargoHash = "sha256-1MsRjuyvSxLo8dFK3yH5i+jeeKFBVGX/4excFYImBc4=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
    sqlite
  ];

  env = {
    OPENSSL_NO_VENDOR = true;
  };

  checkFlags = [
    # Tries to make network requests to other hosts
    "--skip=test_graph_single_day_filter_uses_local_timezone_boundaries"
    "--skip=test_pricing_command_json"
    "--skip=test_pricing_command_success"
    "--skip=test_pricing_command_with_provider"
  ];

  doInstallCheck = true;

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "CLI tool for tracking token usage from various agentic coding tools like Claude Code and OpenCode etc.";
    downloadPage = "https://github.com/junhoyeo/tokscale";
    homepage = "https://tokscale.ai";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ kpbaks ];
    mainProgram = "tokscale";
  };
}
