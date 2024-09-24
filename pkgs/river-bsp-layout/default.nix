{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage {
  pname = "river-bsp-layout";
  version = "unstable-2024-09-23";

  src = fetchFromGitHub {
    owner = "areif-dev";
    repo = "river-bsp-layout";
    rev = "9b228dff36b165819c429408a741d90b000a294e";
    sha256 = "0wbbpqwkfk9lif71b3qim3id9iki34wjzx4z4v6rhii8314471vb";
  };

  cargoHash = "sha256-yJHQbZUX3AMMsOnYDKzRLl810qqQcQjIHV5g0/Ci6pw=";

  meta = with lib; {
    description = "Custom River layout manager that creates a Binary Space Partition / Grid layout using river-layout-toolkit";
    homepage = "https://github.com/areif-dev/river-bsp-layout";
    license = licenses.gpl3;
  };
}
