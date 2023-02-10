final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-02-10";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fe1e6b82f4f3ff3d919d1243f37e9216781bb786";
    sha256 = "00bxdxm8n3c347pq21vmydjz2fd172804cx0gpiwdahvlmshczr2";
    fetchSubmodules = true;
  };

})
