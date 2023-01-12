final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "2aabe9b85870912b9eb8fe2ced0c21544de66f58";
    sha256 = "0zz6nkn5w108sf101ypga39zgmnia7lmdg0y13fw07jkljxnfwhw";
    fetchSubmodules = true;
  };

})
