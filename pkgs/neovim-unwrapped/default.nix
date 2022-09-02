final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "e085d0be31c68921769c6c437920a3346caec69b";
    sha256 = "1vamnr21qzrvjvmna4yrchg6w0kd0cr30x0lb1dkpv3gmbdhiq4g";
    fetchSubmodules = true;
  };

})
