final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "7faf8a45e8c48d5ab1b6096d6b3e23c84bb3d7c6";
    sha256 = "0m301nfj66wbmbvsbfbakw7nldi2j69r28wg32wrd9liv13np4jv";
    fetchSubmodules = true;
  };

})
