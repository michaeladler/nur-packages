{ buildGoModule, fetchFromGitHub, lib, which }:

buildGoModule {
  pname = "bed";
  version = "unstable-2024-04-15";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "d1fc3617de2083208cbbfb13db98f2d8e3157c7d";
    sha256 = "07gd0n9gngdid4gzamdi0vwp1m65nj77y70a9y09p1x9a5ns7445";
  };

  vendorHash = "sha256-l+sUXpP4AIEdrtttTekqb/ce5QpYvv8esFkSvUMteak=";

  nativeCheckInputs = [ which ];

  dontPatchELF = true;

  meta = with lib; {
    homepage = "https://github.com/itchyny/bed";
    description = "Binary editor written in Go";
    maintainers = with maintainers; [ michaeladler ];
    platforms = platforms.all;
    license = licenses.mit;
  };
}
