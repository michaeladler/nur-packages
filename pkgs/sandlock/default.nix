{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "sandlock";
  version = "unstable-2026-08-17";

  src = fetchFromGitHub {
    owner = "multikernel";
    repo = "sandlock";
    rev = "233093b0105e16d76083f6e1a7f780ae11b8e10e";
    sha256 = "1ah364nqx21f22zwj5svpfiqm380w3rlrnkd9yvhkwqq5c174q9x";
  };

  cargoHash = "sha256-CrfQDoocRBEVXFn/9b1k3qztIVV1wg580LWs3nOPx/4=";

  doCheck = false;

  meta = with lib; {
    description = "A process-based sandbox for Linux, no container, no VM, no privilege, no prompt injection";
    homepage = "https://github.com/multikernel/sandlock";
    license = licenses.asl20;
  };
}
