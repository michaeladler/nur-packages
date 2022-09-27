final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1d337d4e2f2265b13ecf19a3bc17ad302d3b0d96";
    sha256 = "0j8xkplamaywb9lqbl0k5y69cfbbkm8yd4g5jpdb0r0g2a669kw9";
    fetchSubmodules = true;
  };

})
