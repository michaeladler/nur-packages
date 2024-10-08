{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.0-unstable-2024-10-07";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "7600a41bbb4dcb5d633d33cf1946eb576c1d6a70";
    sha256 = "sha256-U1y7U/8QDECzz3U9tRE+fu/CgIJzGqXrRv0sswYTwHY=";
  };

  cargoHash = "sha256-gM37gOxsQCiGA+mupookBuDk9zakpLVdFxr5XIF3QgI=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
