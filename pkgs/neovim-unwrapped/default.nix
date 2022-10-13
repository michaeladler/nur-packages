final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "4fbf41dfb4e4c6fd91c5a3d581c771bd1d6839d5";
    sha256 = "101zaih29rx3bgnnn7ssvv3xag23i1w63yvpgz1dlpc7b6yxwsqd";
    fetchSubmodules = true;
  };

})
