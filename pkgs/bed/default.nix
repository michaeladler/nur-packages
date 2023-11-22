{ buildGo121Module, fetchFromGitHub, lib, which }:

buildGo121Module {
  pname = "bed";
  version = "unstable-2023-09-30";

  src = fetchFromGitHub {
    owner = "itchyny";
    repo = "bed";
    rev = "abf92287d6d20cb8afb792534b8c2e0804e90d34";
    sha256 = "1wpp5s8vzr21sk0hxsi2cla48jrx7m9q7zdnnxi7g0g8fpvy5a56";
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
