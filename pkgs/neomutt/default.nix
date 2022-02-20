final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-19";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "73652cbca3ace3468ad0461db4ea89e660921848";
    sha256 = "1hffbgjnx1hx8qpravp37yfij2k477lhm1pfywb717zg73ipy8x7";
  };

})
