final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d89290b453fc29fa288bca0a9e69fd219931ab1c";
    sha256 = "146xj876c5409y6n3sp575wfchjwhidi5skyq4gk8zf1nbwqyfas";
    fetchSubmodules = true;
  };

})
