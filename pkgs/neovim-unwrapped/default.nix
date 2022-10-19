final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-19";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "96cf385a7f4ab29f6987c10b5c3625d99b22f6fc";
    sha256 = "115zj5zasgckxma2slznskv92sg1095hrx8b5nh2km34ly141hdy";
    fetchSubmodules = true;
  };

})
