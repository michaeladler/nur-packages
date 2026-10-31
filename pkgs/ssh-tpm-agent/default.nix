{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
  openssh,
  openssl,
}:

buildGoModule (finalAttrs: {
  pname = "ssh-tpm-agent";
  version = "1.0.0-rc2-unstable-2026-10-30";

  src = fetchFromGitHub {
    owner = "Foxboron";
    repo = "ssh-tpm-agent";
    rev = "440f7fbb420793634da33d1a52eca1ed12a56154";
    hash = "sha256-6xknb7VGGfCxKr7ybv6JoFx/l9qe5/eqOj7I/pW+HBU=";
  };

  proxyVendor = true;

  vendorHash = "sha256-N7JuMUy5Z+HVhxsqESlBkHcHVipRYM8ncx/wR77k1fw=";

  buildInputs = [
    openssl
  ];

  nativeCheckInputs = [
    openssh
  ];

  # https://github.com/Foxboron/ssh-tpm-agent/pull/94#issuecomment-2932568075
  doCheck = false;

  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--flake"
      "--version=branch"
    ];
  };

  meta = {
    description = "SSH agent with support for TPM sealed keys for public key authentication";
    homepage = "https://github.com/Foxboron/ssh-tpm-agent";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ sgo ];
    mainProgram = "ssh-tpm-agent";
  };
})
