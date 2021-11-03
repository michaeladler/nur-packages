final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-11-03";

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "094f56aae3174eccc1312e8a6e7a86dfa676dd1d"; # gaps-next
    sha256 = "09wlsgraczd900184jfhgzx3yl64wrxffi8yza7diqibjlrzxdyb";
  };

})
