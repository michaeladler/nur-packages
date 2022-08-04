final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-03";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "7c997dbc5db145ccfa3c4d687b85168819c8b7d2";
    sha256 = "0zyiwhp8y0mqwn6y26s91zhhaz60bis6c1340cw5yw5vg0irlmfl";
    fetchSubmodules = true;
  };

})
