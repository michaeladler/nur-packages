final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-23";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "1849cf0e4c4376445ff05b9f7f5604b22ac915ff";
    sha256 = "000xfs65qyyzcgfk9h3k8zwhl0fbna57cwqkchigdjdibknfqmgm";
    fetchSubmodules = true;
  };

})
