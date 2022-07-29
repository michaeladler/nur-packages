final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-07-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "88ed33230ac91423f6e09c3f7c07cc02b2b115ac";
    sha256 = "0xd4n0wpxrrqrkwan039f09ndgw48xj8g6z5fmikxl2jv386qmi2";
    fetchSubmodules = true;
  };

})
