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
  version = "0-unstable-2026-05-29";

  src = fetchFromGitHub {
    owner = "junhoyeo";
    repo = "tokscale";
    rev = "d237a00322dbf2e429a031ac7b68c69a1b4dc9fd";
    hash = "sha256-wqB12NH2QDPvhiuPyL8RyKf9b17CE+Zev3i1hnOOGGw=";
  };

  cargoHash = "sha256-McaxzhU2xEdEz9GQTFnUv1l68crBtVpoSlsdsrjuCvI=";

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
