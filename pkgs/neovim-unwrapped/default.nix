final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "6d557e324fd4223fff3279a0112f40431c540163";
    sha256 = "1py0d3r91hnq0cy38aq2s85qspyx70pwi1ma755vs6vhrwfihyfc";
    fetchSubmodules = true;
  };

})
