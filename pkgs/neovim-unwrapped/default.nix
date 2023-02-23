final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-22";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "d422fc8274e757e95329e60b4e6daec59363ba19";
    sha256 = "0ddsf0pinla20c0pa1vbzrkqy57yrr3vfl1625kp2cxq2p5qn938";
    fetchSubmodules = true;
  };

})
