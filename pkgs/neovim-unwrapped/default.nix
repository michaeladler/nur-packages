final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "2bed0d1d978b42184564201088ea5fef12ec8581";
    sha256 = "0brn5khk2kihbpgh1z9m94d2hxvx0y8xy8ffccdwvd24548kis7a";
    fetchSubmodules = true;
  };

})
