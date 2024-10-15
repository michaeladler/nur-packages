{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.0-unstable-2024-10-14";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "5d6a62374141f87281333958818b2c9e760b7e8f";
    sha256 = "sha256-bB9qjhDacHsbej/b41K8ZJvfMQRjQZO4KndtoSARnEs=";
  };

  cargoHash = "sha256-pYpOW8sZhPkwjHcz9QIXxPiJ9cSqLvn0hPnPJQBhUIM=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
