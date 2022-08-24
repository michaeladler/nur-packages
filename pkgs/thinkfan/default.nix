final: prev:

prev.thinkfan.overrideAttrs (old: {
  version = "unstable-2022-08-24";

  buildInputs = old.buildInputs ++ [ prev.lm_sensors ];

  src = final.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = "0df1e9fa1135fcde52742597af231b1f0c513065";
    sha256 = "1is00g8ghib9dlkwaqn1qzs9r7s82fsp89p5rvzyw001rb7z4z3c";
  };

})
