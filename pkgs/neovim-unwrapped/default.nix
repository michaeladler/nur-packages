final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "9220755302317e8030c5bbf334357c0d64df9fa4";
    sha256 = "028939pxba24jlps9n9zpm6ys7fan05szp98j7wz4lvgc4h8qb87";
    fetchSubmodules = true;
  };

})
