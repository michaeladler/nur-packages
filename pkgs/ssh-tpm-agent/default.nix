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
  version = "1.0.0-rc2-unstable-2026-10-26";

  src = fetchFromGitHub {
    owner = "Foxboron";
    repo = "ssh-tpm-agent";
    rev = "43795283993ef79015729399bdecf413fb7705d8";
    hash = "sha256-l6KNW3jgCcIniolyHx1Ijf3cQ0K6iFPdBqbsjcUpjfk=";
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
