{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.1-unstable-2025-02-01";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "a6be91037b882f28100fb65119afa41698700786";
    sha256 = "sha256-HGZrAGbDcqjf21uWatZ8UKUuuTMqAWT0nE5e0how4F4=";
  };

  cargoHash = "sha256-qoRIdGbdzGQJtXeg5A2hnX+sWgH2a8181/Va8QnFGpU=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
