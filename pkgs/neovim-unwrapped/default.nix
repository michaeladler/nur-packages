final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "9c91d5c61382639c06ca59e6cc2bfda6ba6abf18";
    sha256 = "0g3i9ggkw6242fjx1p70n76yk73jg089s0r56q2gp8dilchrrhjz";
    fetchSubmodules = true;
  };

})
