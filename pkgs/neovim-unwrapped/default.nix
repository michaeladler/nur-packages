final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "927d4d2a15b8474cd6c605df65ef53873cf73131";
    sha256 = "1y2876fijqzj90fb6h551ycf5lnvxcnsvrlvhyyrix6cnnlxd5yc";
    fetchSubmodules = true;
  };

})
