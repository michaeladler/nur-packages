{ sources, pkgs, fetchFromGitHub }:

pkgs.dwmblocks.overrideAttrs (old: {

  src = fetchFromGitHub
    (with sources.dwmblocks; { inherit owner repo rev sha256; });

})
