final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1dcaa75a6564b8a90e74a96e242803c6aa3f59cf";
    sha256 = "04hpbzdzsj76g15jgl8v5336vy01k6nbaxww2q85k03qq04qizkf";
    fetchSubmodules = true;
  };

})
