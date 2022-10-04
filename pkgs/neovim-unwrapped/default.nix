final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-04";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a93ff5fc696387798c7ba066c11600ae2ce1ce03";
    sha256 = "0achn1cp9ky45c6hhmqijbsy07kmlxv63bnbrayy2kkrhci0f1cx";
    fetchSubmodules = true;
  };

})
