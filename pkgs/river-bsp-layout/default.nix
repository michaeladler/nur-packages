{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.0-unstable-2025-01-27";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "096df1ab222fe6a15b20c86e75995b92ad05d3ea";
    sha256 = "sha256-SylpezkdC5WHtNWuCavSJl5ImTcnPzVf/8ZDa8KlIrs=";
  };

  cargoHash = "sha256-6m5FkMXkaY4s37BDFsRGnFj2PzyU34DFkIUsJX7WAYk=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
