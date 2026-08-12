{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "sandlock";
  version = "unstable-2026-08-11";

  src = fetchFromGitHub {
    owner = "multikernel";
    repo = "sandlock";
    rev = "3fa12208960e6a5689470d258cb4c83369c5e84b";
    sha256 = "1x3nassnvcb8gw5ff3g79q4grkrjnvfvwn6x7avv1gwdd882xsw1";
  };

  cargoHash = "sha256-CrfQDoocRBEVXFn/9b1k3qztIVV1wg580LWs3nOPx/4=";

  doCheck = false;

  meta = with lib; {
    description = "A process-based sandbox for Linux, no container, no VM, no privilege, no prompt injection";
    homepage = "https://github.com/multikernel/sandlock";
    license = licenses.asl20;
  };
}
