final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-24";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "f3c842058ebc0ac475910726581a738d834955f6";
    sha256 = "0ryqr3qsyhyzfhnmdikdmvm3m925cb84x6rn5kga77v5sfrqmbyb";
    fetchSubmodules = true;
  };

})
