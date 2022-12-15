final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "3091fa778a4f4fe6ff48527c6a29e3be874f46c7";
    sha256 = "1qk9lqrnyim9ycrsl49qsknsjcbm91hxc84x4wnxgxn1hj00jbhl";
    fetchSubmodules = true;
  };

})
