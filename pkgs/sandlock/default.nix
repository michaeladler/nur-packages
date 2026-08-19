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
    rev = "1f2ea34c893eecd26dab6a450aeb8a468a3703b6";
    sha256 = "0f85rfmwrhbz34mp10401g5q2iaw3jd6r1idl8d2zw7rd5xf4x3g";
  };

  cargoHash = "sha256-CrfQDoocRBEVXFn/9b1k3qztIVV1wg580LWs3nOPx/4=";

  doCheck = false;

  meta = with lib; {
    description = "A process-based sandbox for Linux, no container, no VM, no privilege, no prompt injection";
    homepage = "https://github.com/multikernel/sandlock";
    license = licenses.asl20;
  };
}
