final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bf9ad5db962509f3434726b7ad84d31d002fb8a3";
    sha256 = "0y8aa9dyw5y4hgckin8fr9pdqahibf50jzhbwidks72vvlai35w6";
    fetchSubmodules = true;
  };

})
