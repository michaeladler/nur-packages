final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-14";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c4fcde5063899ebfbffef266ba75eafe935da593";
    sha256 = "1ci5qxgw86m9kdqxh6v7pzl8v2hsa74z69hk1i3ifca8f3cda5kl";
    fetchSubmodules = true;
  };

})
