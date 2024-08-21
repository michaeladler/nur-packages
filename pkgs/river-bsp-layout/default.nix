{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "unstable-2024-08-19";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "c075502baf121c397f96bc42ff14d52e52e84c2d";
    sha256 = "1w57bb2dwfl9f2kvw3i8dywx0npj1c0r7lpxma8ibykw1wv60x6q";
  };

  cargoHash = "sha256-zbUC11CadJKnQHIMccIKDHoUBFW2t6fiUT+6kH+ZIco=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
