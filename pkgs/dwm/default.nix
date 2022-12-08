final: prev:

prev.dwm.overrideAttrs (old: {

  version = "unstable-2022-12-07";

  src = final.fetchgit {
    url = "git://git.suckless.org/dwm";
    rev = "89f9905714c1c1b2e8b09986dfbeca15b68d8af8";
    sha256 = "17rd1qx9snfarnwrzmnmcyjk2iyij42hln2r5mj8zagxxn4biwr9";
  };

  patches = (old.patches or [ ]) ++ [
    ./patches/0001-optimize-for-performance.patch
    ./patches/0002-dsblocks.patch
    ./patches/0003-Cycles-through-all-avaiable-layouts-using-MOD-CTRL-a.patch
    ./patches/0004-New-clients-attach-at-the-bottom-of-the-stack-instea.patch
    ./patches/0005-Disable-focus-follows-mouse.patch
    ./patches/0006-swaps-the-current-window-C-with-the-previous-master-.patch
    ./patches/0007-pertag.patch
    ./patches/0008-save-floats-patch.patch
    ./patches/0009-Xresources.patch
    ./patches/0010-stacker.patch
    ./patches/0011-actualfullscreen.patch
    ./patches/0012-selfrestart.patch
    ./patches/0013-preserveonrestart.patch
    ./patches/0014-vanitygaps.patch
    ./patches/0015-fix-build.patch
    ./patches/0016-autostart.patch
  ];

})
