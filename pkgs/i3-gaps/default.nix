final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-11-18";

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "1f6bf271ddc8ba8aed8c225350e965fda75dcf5f"; # gaps-next
    sha256 = "1zlcs0qnkd6l0z3r90pd7yxbdwnq7yc626ndiz1aky5r6qvqn4rc";
  };

})
