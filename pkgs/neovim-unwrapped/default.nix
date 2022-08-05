final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-05";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a78606ec53f7e46884fad274e58c79b8e126b39a";
    sha256 = "15blsvpn2ds29z3809mgpqz1ljbjcl7xhmwkfcnazcbm64ym2g2a";
    fetchSubmodules = true;
  };

})
