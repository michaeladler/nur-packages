final: prev:

prev.thinkfan.overrideAttrs (old: {
  version = "unstable-2022-11-19";

  buildInputs = old.buildInputs ++ [ prev.lm_sensors ];

  src = final.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = "8436612395df70623764eb19cef9008be6c2cb36";
    sha256 = "174yrlkmrb8254j76awn4hsjvy5ajj5y1y2v55gdja15g0m81gdv";
  };

})
