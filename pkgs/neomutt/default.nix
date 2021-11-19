final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-18";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "dd996bc2c80755fd2d991b9058a789687fa12e2f";
    sha256 = "0j7jy18da4g1g4ff1g5pp19ls5bk3qc1v90pg5axs0jdvbsxdjr7";
  };

})
