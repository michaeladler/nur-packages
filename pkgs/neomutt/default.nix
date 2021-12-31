final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-30";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "ebbdb90f6eaca1a63fa9a84a65a2e80370f317e7";
    sha256 = "1m8kch4y0wmhn2rr97yncrnrpj32c52myj0mv9qvxb0sv48pgcyi";
  };

})
