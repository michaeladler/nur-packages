final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-18";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a5ed89c972a23c46eb3988fe8c2c8ae0d7ed844f";
    sha256 = "18jk6k8q7r7c40k086n78y1jygnxd62p2b288xwz26rpp7lghi7s";
    fetchSubmodules = true;
  };

})
