final: prev:

prev.thinkfan.overrideAttrs (old: {
  version = "unstable-2022-08-24";

  buildInputs = old.buildInputs ++ [ prev.lm_sensors ];

  src = final.fetchFromGitHub {
    owner = "vmatare";
    repo = "thinkfan";
    rev = "11ce0006533e8344da83703f8821a854e578bb4d";
    sha256 = "0qd60810hmbg6lv9y4618xw17bjqvv6kvx49rahiw0xhli507gky";
  };

})
