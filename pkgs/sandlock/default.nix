{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "sandlock";
  version = "unstable-2026-09-02";

  src = fetchFromGitHub {
    owner = "multikernel";
    repo = "sandlock";
    rev = "bb88f4b3d9a9e1b213b2f160347ab6ad81c11fd6";
    sha256 = "1ha1pm1ig8644x0x4qgcxwlcarisw53nfdh0i31s80s7qxxjsgky";
  };

  cargoHash = "sha256-CrfQDoocRBEVXFn/9b1k3qztIVV1wg580LWs3nOPx/4=";

  doCheck = false;

  meta = with lib; {
    description = "A process-based sandbox for Linux, no container, no VM, no privilege, no prompt injection";
    homepage = "https://github.com/multikernel/sandlock";
    license = licenses.asl20;
  };
}
