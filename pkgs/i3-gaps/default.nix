final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-11-27";

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "6aaae79c8665f6dba8ff8b4c6263140d1a618fc7"; # gaps-next
    sha256 = "08nw3dn46dir1czwd6hw6slrz4lh9gvbv9ynaqa2vkfs742jbrgx";
  };

})
