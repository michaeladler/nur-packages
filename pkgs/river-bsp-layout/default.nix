{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.0-unstable-2024-09-30";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "7be173dc7e0ddd29703577ed219cca87dd03c13a";
    sha256 = "1kbw6n4gjn32g547yn0vck9zlq5mqkrq3k1rr1azmswaziyvwfgm";
  };

  cargoHash = "sha256-Z/lvwHYfas7zpN9zcycM5+tnPv/wSv5rgD+sXiSJ+Sk=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
