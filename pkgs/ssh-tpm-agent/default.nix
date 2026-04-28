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
  version = "0.8.0-unstable-2026-04-27";

  src = fetchFromGitHub {
    owner = "Foxboron";
    repo = "ssh-tpm-agent";
    rev = "3854ff20dfa9cd174f7950ac2062ad3baa6d7b35";
    hash = "sha256-KvTbl3VjtgiQrRdwU+I4Has/eTN1ZsN8GI6Py0BlNVE=";
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

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "SSH agent with support for TPM sealed keys for public key authentication";
    homepage = "https://github.com/Foxboron/ssh-tpm-agent";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ sgo ];
    mainProgram = "ssh-tpm-agent";
  };
})
