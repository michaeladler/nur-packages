final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-04";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "0aba1761714661b8576d4676c61c319e76bfac1b";
    sha256 = "11l3zfcy58hm0kmc0cy1q4dw7ygbr19s0xvpdbqhz7j4v40jhp1i";
    fetchSubmodules = true;
  };

})
