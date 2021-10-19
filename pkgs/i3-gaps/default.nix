final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-10-18";

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "588b9c2c368542d5075a36f267b006eda8d8893c"; # gaps-next
    sha256 = "1yd2vvhbpiclj1ani6yqgsh1skbw7120j4qm4wiclj1pc0pns2kc";
  };

})
