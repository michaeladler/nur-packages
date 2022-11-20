final: prev:

prev.thinkfan.overrideAttrs (old: {
  version = "unstable-2022-11-20";

  buildInputs = old.buildInputs ++ [ prev.lm_sensors ];

  src = final.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = "951d7d2f84b3062f69d949707c23287ec48a6ec7";
    sha256 = "081p7sx14qx2yn9bfb42dcvx9j8qkls7igk3gkcmzbz192kxvmnq";
  };

})
