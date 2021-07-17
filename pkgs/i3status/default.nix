final: prev:

prev.i3status.overrideAttrs (old: {

  patches = (old.patches or [ ]) ++ [
    ./patches/0001-Enable-click-events.patch
  ];

})
