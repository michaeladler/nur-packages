final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-26";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "9dfbbde240fc095b856d8e0e1c670b1912ec6640";
    sha256 = "06ixja12gbvss0q53jxcw4hjb39fzfm0xgf24z5gwlcmc4224r6q";
    fetchSubmodules = true;
  };

})
