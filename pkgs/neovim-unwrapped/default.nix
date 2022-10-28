final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-28";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "685ff3ee7247c5118fd8ef1c229af60066a4fcb4";
    sha256 = "044v8x738cpdswp9mf4ddf769nk4ya301ilq3cnxcw7gxn80mx0h";
    fetchSubmodules = true;
  };

})
