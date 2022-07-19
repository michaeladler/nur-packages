final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-19";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a80d447b47c22985a467ce9d2aaf214e966ca642";
    sha256 = "1v68b1qaj7sjcqc226axam230qrhagckrfyy3a1sj7zky4m9izpa";
    fetchSubmodules = true;
  };

})
