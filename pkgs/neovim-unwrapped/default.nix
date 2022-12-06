final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "54a1cc0ab0ad5cfad1f7c7b95ac4636ba6d5ee14";
    sha256 = "1yl75xhvfii4aakxind71zx96vs0rnr2p0sh8jrwj0v3cq0vnw1y";
    fetchSubmodules = true;
  };

})
