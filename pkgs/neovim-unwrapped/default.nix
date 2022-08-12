final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-11";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "33b77eb728a1f07926ba19c4f09fd20e806de363";
    sha256 = "0wj2zhynm4h2am7hh6wcxhzf16wr0b915c84vr1vxamzd0wrfrf2";
    fetchSubmodules = true;
  };

})
