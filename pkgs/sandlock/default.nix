{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "sandlock";
  version = "unstable-2026-08-14";

  src = fetchFromGitHub {
    owner = "multikernel";
    repo = "sandlock";
    rev = "4e85b5025f884172d61e33aa788af3dbec996854";
    sha256 = "0gay2r209p3xs6fy9bpj8dyxkf9f6y83wv9a50da0lqzg09wxy3f";
  };

  cargoHash = "sha256-CrfQDoocRBEVXFn/9b1k3qztIVV1wg580LWs3nOPx/4=";

  doCheck = false;

  meta = with lib; {
    description = "A process-based sandbox for Linux, no container, no VM, no privilege, no prompt injection";
    homepage = "https://github.com/multikernel/sandlock";
    license = licenses.asl20;
  };
}
