final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "efacb6e974fa6391bcc916749103f04fa9b9f6f7";
    sha256 = "1fnv0brbk4rghc6hivyyxcniccfvx0vn19bw6w20ybmn40k9jwsn";
    fetchSubmodules = true;
  };

})
