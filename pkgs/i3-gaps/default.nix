final: prev:

prev.i3-gaps.overrideAttrs (old: {
  version = "unstable-2021-11-07";

  src = prev.fetchFromGitHub {
    owner = "Airblader";
    repo = "i3";
    rev = "0733951a724824f4ab4e2940083d97e4ca2ff3b2"; # gaps-next
    sha256 = "1mb99hyi08xs0zx0250cqp9jprpih5ilhx5dlvxivpfvfgna4sqq";
  };

})
