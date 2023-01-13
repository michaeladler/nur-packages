final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2023-01-13";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "fd3d30a22c2bcc7acd266214b761b44219aefbe7";
    sha256 = "0yh0g76qrv06y1m6pji301lcj006naxajx8fp5padf2867z9khy1";
    fetchSubmodules = true;
  };

})
