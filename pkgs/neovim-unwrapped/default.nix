final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "56998feebd6f7ec0ab68e44cba3425bf39d448b4";
    sha256 = "154hac794mf24d7fwzsqn7hz70xs6r05jqd93s9k1bh4d2lx6la0";
    fetchSubmodules = true;
  };

})
