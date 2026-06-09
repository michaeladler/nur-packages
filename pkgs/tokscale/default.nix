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
  version = "3.1.0-unstable-2026-06-08";

  src = fetchFromGitHub {
    owner = "junhoyeo";
    repo = "tokscale";
    rev = "c21980739c56a3d430d7b6af6dccb2376b925b6b";
    hash = "sha256-2F9GAjVVbQn7iSi5Z89sIpd68SL+dYs1ddRZxc31LRk=";
  };

  cargoHash = "sha256-hSJjmLxbPBp8dT2J+L3gcwa1Esr4cl8YeJbses/HQRM=";

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
