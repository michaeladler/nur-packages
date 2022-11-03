final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "65f603f72c387cfac7955d8dfe51b42d35caa0f8";
    sha256 = "1m5i3dyclphdsp5yjy7iprmbrd5f88kr09cr7aq1agc7vrqpiigw";
    fetchSubmodules = true;
  };

})
