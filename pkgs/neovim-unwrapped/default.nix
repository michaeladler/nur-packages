final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-09-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "a80ab395aa7beedf8f39870d331b4b32cc6e5d2d";
    sha256 = "06nk3wgjj25zpf2gx7b69jd9fnykic7mv0f87sjqkbday7i4k6xc";
    fetchSubmodules = true;
  };

})
