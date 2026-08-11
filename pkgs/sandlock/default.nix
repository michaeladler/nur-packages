{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "sandlock";
  version = "unstable-2026-08-10";

  src = fetchFromGitHub {
    owner = "multikernel";
    repo = "sandlock";
    rev = "0059c2a77bff5944c3db321ff5c84661c28b66d2";
    sha256 = "0rxvs0zx55yjl1vdl09s4ac0rmls1qn0b439m8f4pw1f7pr6dp6p";
  };

  cargoHash = "sha256-CrfQDoocRBEVXFn/9b1k3qztIVV1wg580LWs3nOPx/4=";

  doCheck = false;

  meta = with lib; {
    description = "A process-based sandbox for Linux, no container, no VM, no privilege, no prompt injection";
    homepage = "https://github.com/multikernel/sandlock";
    license = licenses.asl20;
  };
}
