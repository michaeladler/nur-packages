final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-03-05";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "92d713809f8ab2fc5a082ba542c2d17120f0e684";
    sha256 = "13bhcdj9fyp7clwn529yfcihqppvy8w0l36pzqlsdkarffkig3hc";
  };

})
