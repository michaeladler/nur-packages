final: prev:

prev.dwm.overrideAttrs (old: {

  version = "unstable-2022-10-28";

  src = final.fetchgit {
    url = "git://git.suckless.org/dwm";
    rev = "ba56fe9fea0a28d8184a727a987836a0903e2682";
    sha256 = "0b8fnhf59miqgsvmgn1rbh6llb8ii09s3vgvi8kqvb4d35nmpx3g";
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
  ];

})
