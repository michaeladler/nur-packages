final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-01";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8952def50afa8308e044c0100e6d4fa367d0a9c2";
    sha256 = "0cwzd5z66dqxxkyr7iz9gxvbn81nnz57yiqb9scj894v0gpkzz58";
    fetchSubmodules = true;
  };

})
