final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-11";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d9a80b8e29182230693c9091ac397f96e7222fbb";
    sha256 = "0njbwyb4z045829mc0chp05qhm4bbrfm1j7nhsx093hdkiznmfhs";
    fetchSubmodules = true;
  };

})
