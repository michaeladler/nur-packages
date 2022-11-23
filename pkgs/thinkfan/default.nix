final: prev:

prev.thinkfan.overrideAttrs (old: {
  version = "unstable-2022-11-23";

  buildInputs = old.buildInputs ++ [ prev.lm_sensors ];

  src = final.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = "88e240b57368ef192148ebea8223b496ee80e1f7";
    sha256 = "1lnlpz6ilgyxj055fc0xs2wvarxi0nqqig66ljxixsvqsfk9l8sp";
  };

})
