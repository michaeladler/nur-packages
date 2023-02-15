final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-15";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8307ed3a194d0c0420feb0b3e5c2f6919095415f";
    sha256 = "1pnvbigs8rp2kxkdsckbk2y3gyal0za4145blyczb9v61xba78ab";
    fetchSubmodules = true;
  };

})
