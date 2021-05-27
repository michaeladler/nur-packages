{ src, pkgs, fetchFromGitHub }:

pkgs.dwmblocks.overrideAttrs (old: {
  inherit src;

  version = toString src.lastModifiedDate;
})
