final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2022-06-01";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "590b0e07b22b2855eede05d1fa862da211ca364e"; # gaps-next
    sha256 = "1kqpb2z79g023c2ixx8r4cxyqa6f4rsbig3wyxvk148659rhpy8d";
  };

})
