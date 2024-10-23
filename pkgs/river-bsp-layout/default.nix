{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.0-unstable-2024-10-22";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "a3c0340505a65e13c481fc224c0bd0042bcf207d";
    sha256 = "sha256-14MqvjYMlUk6MBYU2Rjo1BL2QjNpjzLwDoorSBLADVQ=";
  };

  cargoHash = "sha256-xoxfbmVKV+4fjuHB1877oKKNCssIbdmAbtJvIkQYAfc=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
