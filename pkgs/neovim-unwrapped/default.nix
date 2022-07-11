final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ba5be650a796f868f1caf822370e694d24600666";
    sha256 = "sha256-pa9aKMUt5IybeAyskz9UPakDohqspDX1O54A7/k1Lt8=";
    fetchSubmodules = true;
  };

})
