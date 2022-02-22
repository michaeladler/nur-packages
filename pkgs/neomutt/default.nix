final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-21";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "2ccae1a89d87302c3bef634ab5196a18135f9241";
    sha256 = "104k3ig2i1kafw29jphmz1xi0gcalz29ikqxf9q4r54z8q53fw1p";
  };

})
