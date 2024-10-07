final: prev:

prev.kanshi.overrideAttrs (old: {

  patches = (old.patches or [ ]) ++ [
    ./patches/0001-Match-outputs-with-regular-expressions.patch
  ];

})
