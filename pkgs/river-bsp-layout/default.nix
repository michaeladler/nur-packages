{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.0-unstable-2025-01-13";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "df4636219c99fb73cc9471aeca523aa23d401584";
    sha256 = "sha256-WxCosU2lrtLpxkJQeUyghuBP6lSa1dra4Vto6qlg/3Y=";
  };

  cargoHash = "sha256-Xysp4Feasy3uR/39k6sbghfd4FJwtrZOIejaK8/DYY8=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
