final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-01";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "61e99217e68498e757b9f8b0c70978a9635ccbfa";
    sha256 = "0w3w5wl7qz4k3hhmxl61a68jp9ahjj29f1sirg03wgi8c7l1bizd";
    fetchSubmodules = true;
  };

})
