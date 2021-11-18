final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-17";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "54c93c9f9abcfccad8cc50f33625ec7783344fdd";
    sha256 = "0q17skywgyc3j4wxn8c8l6sf6cz1dxr1528fwrh8gwp8nhhxzf0w";
  };

})
