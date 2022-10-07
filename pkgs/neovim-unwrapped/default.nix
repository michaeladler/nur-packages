final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-07";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d191070913dc195309926a91f97008defd877a71";
    sha256 = "1swx0ac9c52w4hv21g5zgwgan77m569c7089bw131ri0i3zbljk3";
    fetchSubmodules = true;
  };

})
