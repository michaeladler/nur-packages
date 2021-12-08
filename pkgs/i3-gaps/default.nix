final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-12-07";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "12097d435a2613637532ff190089fdb9f7ae31aa"; # gaps-next
    sha256 = "0af7r337vv133lpjc7zhglylx76q8nqbbv6zqic69613l9f8g75f";
  };

})
