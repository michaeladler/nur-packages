final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "c9adbcafaec6c7aecb01e8f06a423a74b0a01116";
    sha256 = "1jrgh4yr2bampibd0sp71myz4ij435b82smyd2lh9p4vpyw6s2nz";
    fetchSubmodules = true;
  };

})
