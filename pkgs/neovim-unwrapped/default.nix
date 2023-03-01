final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-01";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "aa840ab5668aa9bc013461a48da771f778b39e49";
    sha256 = "0a2gi8f6vddcg859jfld2wvhvlll8hm25g06iiah7s0xkpr05745";
    fetchSubmodules = true;
  };

})
