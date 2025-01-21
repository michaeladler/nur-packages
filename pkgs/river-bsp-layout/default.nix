{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.0-unstable-2025-01-20";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "a5422571349d0f745bb01861779162986a81f9eb";
    sha256 = "sha256-RLs5FtCzdMcq4TZPIvpO2pPNBzBZ/xVtet/XUPBYINE=";
  };

  cargoHash = "sha256-ZcChhkT/fNNlU5fFceg+fk//y4Fdh0toFlMSqGme/BI=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
