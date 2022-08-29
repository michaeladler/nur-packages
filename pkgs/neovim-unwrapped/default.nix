final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-08-29";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "253f0ffd8d4784b7fca03f8f6c2455b9ee83ff9b";
    sha256 = "0p247vrlpg8aazlqf3370anhn50lwy4qvkdgi0h9whbz2l9dbg4z";
    fetchSubmodules = true;
  };

})
