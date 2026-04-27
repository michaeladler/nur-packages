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
  version = "0.8.0-unstable-2026-04-24";

  src = fetchFromGitHub {
    owner = "Foxboron";
    repo = "ssh-tpm-agent";
    rev = "0297aa9c181c92be1ce4bbda6d3c77536a9a592d";
    hash = "sha256-NuPUNPUBufA3ke1gVbgMENeOzFAEMVLFNeqF9vR3GTY=";
  };

  proxyVendor = true;

  vendorHash = "sha256-s899KmXdeUt/SSCL3Vu1T/JTJT8mZP99MDb+Thcfyw4=";

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
