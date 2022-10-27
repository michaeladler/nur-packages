final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-27";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "bce6891a69c6de3657173b880d3a800dc94cc651";
    sha256 = "0pp55jjg6wk9kc49mjybrdyszq0qi6jnzsv7xn6dyknw71dkbdr6";
    fetchSubmodules = true;
  };

})
