final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-12-01";

  buildInputs = old.buildInputs ++ [ prev.pcre2 ];

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "7af1bb4d1d216ec01fa451bf8e0d8ba78eefd0dc"; # gaps-next
    sha256 = "16p5f8is6f0x3p0ahhwk8q5vgc5gv4c0gai26ydgg2q02ksrlklf";
  };

})
