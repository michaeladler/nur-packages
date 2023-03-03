final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-03-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "361de6d54d41fc0fc8f8a89ec779696f3f7bb46e";
    sha256 = "0sprq96s7yd60x3zcih4jdhgsp2hkyd0ipa86vjz5i7nq1kxfr2m";
    fetchSubmodules = true;
  };

})
