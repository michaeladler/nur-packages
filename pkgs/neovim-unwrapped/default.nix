final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-05";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fb39bba5a6d279101ca6925aa7b4ebf13f8238e4";
    sha256 = "1q2k2865cl6ak6njal159k8p17sk0h73h8va3xv27hkj9626mv29";
    fetchSubmodules = true;
  };

})
