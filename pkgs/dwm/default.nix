final: prev:

prev.dwm.overrideAttrs (old: {
  version = "2021-05-21";

  src = prev.fetchFromGitHub {
    owner = "LukeSmithxyz";
    repo = "dwm";
    rev = "eab52c4f48c0fcfd7c78d41418f2e10dc1b48ed2";
    sha256 = "1dazcwm3l9nnx1h6yv4snr8q4v548b7ri6lly1s7f55nwjwzbyni";
  };

  patches = (prev.dwm.patches or [ ]) ++ [
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
