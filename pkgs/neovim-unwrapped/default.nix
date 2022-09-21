final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-21";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "ad1f353fe1aeb54144a34d1a0de8e318bd5113aa";
    sha256 = "0pq2fn7cvzpypfil6lkf390q82c1wq2mffndi54zxpdc50zgx3bg";
    fetchSubmodules = true;
  };

})
