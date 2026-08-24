{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "sandlock";
  version = "unstable-2026-08-23";

  src = fetchFromGitHub {
    owner = "multikernel";
    repo = "sandlock";
    rev = "f6a3e39b31afa80f66609c8af8ae5b2582f628e8";
    sha256 = "1jwimjgxjpj6agyyyvqa5fr2j3zb4cxmrr3r0d66z39najdq21nr";
  };

  cargoHash = "sha256-CrfQDoocRBEVXFn/9b1k3qztIVV1wg580LWs3nOPx/4=";

  doCheck = false;

  meta = with lib; {
    description = "A process-based sandbox for Linux, no container, no VM, no privilege, no prompt injection";
    homepage = "https://github.com/multikernel/sandlock";
    license = licenses.asl20;
  };
}
