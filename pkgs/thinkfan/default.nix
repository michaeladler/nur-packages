final: prev:

prev.thinkfan.overrideAttrs (old: {
  version = "unstable-2022-08-25";

  buildInputs = old.buildInputs ++ [ prev.lm_sensors ];

  src = final.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = "b5bf2e679c6820cdb119e1bc56e7e91f222e4376";
    sha256 = "0p54g2vpv041fv10b3yf6pnjzx14788iyw2bbq8kv0gwbpjcc0sj";
  };

})
