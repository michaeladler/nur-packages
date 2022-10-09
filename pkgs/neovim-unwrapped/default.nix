final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-10-08";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "edc8a1f04631b021f9c5e79f7162e34f7c3299db";
    sha256 = "19sb2kikv6mw66598k1nmkw9ci2kc633mhvkcpncbqzzwml4mrzg";
    fetchSubmodules = true;
  };

})
