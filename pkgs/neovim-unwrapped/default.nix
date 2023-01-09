final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-09";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c19bd47c0a2e3cc77d7f5e41ed184edb41685bd3";
    sha256 = "1sihhyllv7xjrnl051s8lbznq75dxlg1gm0vvix0xc6b6dsibdn4";
    fetchSubmodules = true;
  };

})
