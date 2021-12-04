final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-04";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "6653523ac3f253cc56975bfea78fc38cc903167d";
    sha256 = "1fllpwyl65i4b11yhcfr54jw9fm32c3mgll8np2zp3y0dpxb6x9y";
  };

})
