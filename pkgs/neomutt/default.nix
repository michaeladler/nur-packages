final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-04";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "c945ae975f99db3fc182dcce0ff3b60c5c9d5180";
    sha256 = "1yl6jfsbld8gjv1fx2iwsc48w6cm5q6wi48fxzlny0r7wnmpkskk";
  };

})
