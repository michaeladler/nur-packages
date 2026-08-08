{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "sandlock";
  version = "unstable-2026-08-07";

  src = fetchFromGitHub {
    owner = "multikernel";
    repo = "sandlock";
    rev = "033f7e24e29047a17aeb6f2f0e8fd77c69978abb";
    sha256 = "0d7qgfywni62wah8nmq8y0sbfqp1d85mqm8vzl823qh7djj2cq0a";
  };

  cargoHash = "sha256-CrfQDoocRBEVXFn/9b1k3qztIVV1wg580LWs3nOPx/4=";

  doCheck = false;

  meta = with lib; {
    description = "A process-based sandbox for Linux, no container, no VM, no privilege, no prompt injection";
    homepage = "https://github.com/multikernel/sandlock";
    license = licenses.asl20;
  };
}
