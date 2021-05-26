{ sources, pkgs, fetchFromGitHub }:

pkgs.dwm.overrideAttrs (old: {

  src = fetchFromGitHub (with sources.dwm; { inherit owner repo rev sha256; });

  patches = [
    ./patches/0001-cyclelayout.patch
    ./patches/0002-Attach-bottom.patch
    ./patches/0003-Disable-focus-follows-mouse.patch
    ./patches/0004-Put-master-to-exact-position-of-zoomed-client.patch
    ./patches/0005-pertag-keep-layout-mwfact-barpos-and-nmaster-per-tag.patch
    ./patches/0006-fancybar-show-the-titles-of-all-visible-windows.patch
    ./patches/0007-taglabels.patch
    ./patches/0008-Cool-autostart.patch
    ./patches/0009-save-floats-patch.patch
  ];

})
