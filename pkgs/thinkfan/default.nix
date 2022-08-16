final: prev:

prev.thinkfan.overrideAttrs (old: {
  version = "unstable-2022-07-28";

  buildInputs = old.buildInputs ++ [ prev.lm_sensors ];

  src = final.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = "61c1805432344b1ba9a25d00be24965824fbcd0f";
    sha256 = "1cnc1khsn0qdpzizgdqvnc93dbgkh2i2fd3w5z98jxfrph7y3a4b";
  };

})
