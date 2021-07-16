final: prev:

prev.handlr.overrideAttrs (old: {

  patches = (old.patches or [ ]) ++ [
    ./patches/0001-Fix-crash-on-read-only-mimeapps.list.patch
  ];

})
