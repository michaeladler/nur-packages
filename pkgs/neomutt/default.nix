final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-01-03";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "3bd10b0193e3c56d2cb7bdb11e80b75539565df3";
    sha256 = "0rfxshhkb5wr8w1flzdnbs6m0q9lk28qv5c5ia2xsy1d9gd3spp7";
  };

})
