final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-17";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "371a74e4e1685f21e83c70eb8f0bd05c2ce24e49";
    sha256 = "1k54csxblxdmvzb0dhn1lwxwm9z4x744xrd94wxwi27ikl1sm45x";
    fetchSubmodules = true;
  };

})
