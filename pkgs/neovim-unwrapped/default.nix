final: prev:

prev.neovim-unwrapped.overrideAttrs (old: {
  version = "unstable-2022-11-30";

  src = prev.fetchFromGitHub {
    owner = "neovim";
    repo = "neovim";
    rev = "282dda643ae598d5c8e9f34c379d931563b4891b";
    sha256 = "1xwlglh87ilamg3999h4zb1sk4z77p5nbcw0b8d0vsb8m6dikgf1";
    fetchSubmodules = true;
  };

})
