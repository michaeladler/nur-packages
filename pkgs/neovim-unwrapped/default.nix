final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-12-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a6b05cb75d330dd995d3ad21ee08bb0a2cfcae74";
    sha256 = "1r3h5dal9ri3dkgqsbxig16lhyqxrzqwa38dissn4k9qanvbzzg3";
    fetchSubmodules = true;
  };

})
