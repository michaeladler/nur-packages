final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-02";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "41f308feab35007534f0c213947701174d60c548";
    sha256 = "00zr8w7paz8vljjn1azfsriwnvy86adwwnfjlsjh4ryw3acriqjc";
    fetchSubmodules = true;
  };

})
