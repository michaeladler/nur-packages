{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "unstable-2024-09-15";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "526761bbd66f151420252735f9823a6c33156956";
    sha256 = "0rgq933ja0lqayhqj109c5pdpccgh59ns63djq2pfrjxx9bskylq";
  };

  cargoHash = "sha256-ZAznaUkXKmMS1ul4joa271/195PquZ/8Q1SkRvsFS9M=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
