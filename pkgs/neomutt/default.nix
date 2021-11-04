final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-03";

  patches = [ ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "fe244a5c0a002a288de3c9f7d64bf6287dd82769";
    sha256 = "094dhvn80bhsbmfcalz2380ph1vdvz8fd842575p5f8j0abr4yjz";
  };

})
