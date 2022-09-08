final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e93f22f28abe8f774c5e081073cb2eac0f5085fd";
    sha256 = "1g82rgj2j89j77wq9vs30cb2a2s0l6m3adbn4cjagrzmdmpzf9kf";
    fetchSubmodules = true;
  };

})
