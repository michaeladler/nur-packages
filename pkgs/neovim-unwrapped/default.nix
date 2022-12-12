final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-12";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "3217a31f9b0eb93a9c4d01f6a15b9a104e4f56f3";
    sha256 = "0ak80b356dfbzkqbiw30i3c65rjn09ig3mf68fc9kmbbvw2aisk8";
    fetchSubmodules = true;
  };

})
