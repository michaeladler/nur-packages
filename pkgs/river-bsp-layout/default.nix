{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "unstable-2024-09-10";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "da56dfecc2ece59e35c874c26631d652bd45f4d6";
    sha256 = "1pnq9pihnc943y0628if7r5addvgxy5zjyb6wkf8r118rbw1pyxb";
  };

  cargoHash = "sha256-29F5d33KjRkhwdlwarNcEej8OaG96A2/F6HVZf5uLLI=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
