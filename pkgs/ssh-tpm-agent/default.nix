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
  version = "1.0.0-rc2-unstable-2026-10-02";

  src = fetchFromGitHub {
    owner = "Foxboron";
    repo = "ssh-tpm-agent";
    rev = "5d1974b94bfb5bdc1cde68bb1aa38580a42c6fe1";
    hash = "sha256-4PAo/r++DIQ7ZZgBoffXH99MzDJfpWr/uyvFwsIINek=";
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
