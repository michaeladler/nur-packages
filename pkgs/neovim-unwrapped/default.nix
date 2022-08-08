final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "18766e742bdc8d179ff73b739a530052c9a669e5";
    sha256 = "0b2imb5f1zr0057jhlsq0ci2734pd23hwh1ybf7h28s2xc275wds";
    fetchSubmodules = true;
  };

})
