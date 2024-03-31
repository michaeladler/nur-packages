{ buildGo121Module, fetchFromGitHub, lib, which }:

buildGo121Module {
  pname = "bed";
  version = "unstable-2024-03-30";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "891b0ddb93cfc052ca0acf2c27087e1698e77ba0";
    sha256 = "103jmbz3ip09p2pgx6w99lg3bypxjysi1dsnflm1f7kmgxbk3jdg";
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
