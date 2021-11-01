final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-10-28";

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "f09ce2b51eba6eb5896d860195836999591603fe"; # gaps-next
    sha256 = "1ijibkrpfk57rq2lx22vpalyr2079zfg2v0ynkkc66figyi3pn2i";
  };

})
