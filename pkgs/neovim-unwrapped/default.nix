final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "274609a109fe7d4a72107e45fd1f13c2066a3663";
    sha256 = "1s9p5ymgvvr9fil23bsafszq409r2z6wfcbwsfhp1i3q3xsvakqg";
    fetchSubmodules = true;
  };

})
