final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "7a70e9587c866c506182a32839f4c3b27b9a3b40";
    sha256 = "12wg4g2043plcrwg5c7yk8drnqjbd91nwplzk31sp2qix77njnwj";
    fetchSubmodules = true;
  };

})
