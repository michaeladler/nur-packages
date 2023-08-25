final: prev:

prev.hikari.overrideAttrs (old: {

  patches = [
    ./0001_xwayland.patch
    ./0002_gtk4.patch
    ./0003_disable-outputs.patch # this one is from me
  ];

})
