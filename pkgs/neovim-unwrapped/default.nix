final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "982fef6018fb64c883ddafc897c8f7c58fb1c62d";
    sha256 = "0a1j926355ylln0lzwxzmvgmir843vsq6nwnzlmki1sqvwb35ikd";
    fetchSubmodules = true;
  };

})
