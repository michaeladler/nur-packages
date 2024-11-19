{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.0-unstable-2024-11-18";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "ea8f0c61a048b609c154c69216c6dbab7e3060f8";
    sha256 = "sha256-4Lr9hHPMc2o3yXt7Wu92Mb2XCWfswj7G8KV/B34V8uY=";
  };

  cargoHash = "sha256-7f+eBZbM64wIPQzkOSovB73GM0XSxLLXstRFhba01P4=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
