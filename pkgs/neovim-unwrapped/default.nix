final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "74399738510cb880507cba14f71acc0a96e14327";
    sha256 = "1qw1320iyb1pkzympml78vvwa1vf36r75wcw90b4xgl9p9fq8di1";
    fetchSubmodules = true;
  };

})
