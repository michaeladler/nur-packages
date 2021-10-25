final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-10-24";

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "91922d061b7156601694a4eacdbf8dd47a00a3e9";
    sha256 = "1a86sh7nfq3nxs8q301q5kqlk9qq89q8ml6vs1p8qc24ffjpbj5z";
  };

})
