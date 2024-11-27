final: prev:

prev.aerc.overrideAttrs (old: {

  patches = (old.patches or [ ]) ++ [

    (final.fetchpatch {
      name = "fix-explicit-searches-for-excluded-tags";
      url = "https://github.com/rjarry/aerc/commit/8060cbe70b0068928629a9b7263768d067766878.patch";
      hash = "sha256-ZGTt+ihKVojIxnFsI7eoyO+y9gRtg2mMIiJ1uFgZ/GM=";
    })

  ];

})
