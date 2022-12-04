final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-04";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "b866d8d2e7cf4c2f00b1adc997188f1d04c13fa1";
    sha256 = "0943hf5zi0gp5clcfjhmqfqx1srbcwrya9hajwlcav5k1fblm2y0";
    fetchSubmodules = true;
  };

})
