final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-06-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "7dd73625dccc8abddf892b54017b655cdafa1183";
    sha256 = "1h6xwcd0mhyyrvy3shhjgp38yr0dhh9z0lskf34pc7wscv66hvvm";
    fetchSubmodules = true;
  };

})
