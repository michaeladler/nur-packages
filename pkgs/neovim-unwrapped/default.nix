final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "cc5b7368d61cfcd775dd02803dbdb8d4d05b5d5d";
    sha256 = "1zgdf9im55nmbyl0101djwbq9g25yjq2z6g3zcq97fi6sgp1bw70";
    fetchSubmodules = true;
  };

})
