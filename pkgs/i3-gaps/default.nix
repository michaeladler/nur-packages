final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2022-05-17";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "2b60c55a7067ad575909c6ff987665b6d40eeaa0"; # gaps-next
    sha256 = "1yql4lnv404blb99rkmkgn140b66f0grrybsl1af8xvdjb36fk04";
  };

})
