final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-06";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "5f0fbe7c2fae82c3bf911d726af483c8a0983379";
    sha256 = "0ch41r7azwdis1hjphyaqa9i41m5k7lz8isg7qr3ycagdhxpqi1h";
    fetchSubmodules = true;
  };

})
