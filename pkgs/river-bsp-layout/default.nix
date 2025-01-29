{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "2.1.1-unstable-2025-01-28";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "0a777f2bd77005d8b876de98809523aa9a93e258";
    sha256 = "sha256-/R9v3NGsSG4JJtdk0sJX7ahRolRmJMwMP48JRmLffXc=";
  };

  cargoHash = "sha256-CDWZYVdJLcNAub3tZpitBldMrQ3eaA4jpO15lG3OMtQ=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
