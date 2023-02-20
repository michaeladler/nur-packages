final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-20";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "8784f064f15e5ae0b6bc85c2972ec16c64656e2b";
    sha256 = "0shmsviwszqqgdhblpz10bpgs4iaf7c6yg0p3svgaihg14c83jfz";
    fetchSubmodules = true;
  };

})
