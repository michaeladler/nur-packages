final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-10-11";

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "2f7088e313b1eda1dde1f1200d20195fffa87145"; # gaps-next
    sha256 = "18697k98b33hp0n66hqgn6172siyznhnybm4qhb56w03vf31bqvg";
  };

})
