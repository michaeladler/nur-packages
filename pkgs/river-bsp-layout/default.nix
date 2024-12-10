{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.0-unstable-2024-12-09";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "4f39269703a30c66038b77ff4132e5a5e68abff0";
    sha256 = "sha256-q7XRU164d7WYSAkhlROQTBOSs9YfiHc7F7i9fmFtPfk=";
  };

  cargoHash = "sha256-9ZUlY6ycTAhHYKjlfQEfaXZpbaqUqdwvnlcn6TtPi50=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
