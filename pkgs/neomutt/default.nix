final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-29";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "a703b4c1e3ff8109d2568c2b9b1b4fc6b67ae2e3";
    sha256 = "13y0w9isg832cybizqxfry0rzkfh4s1npr41yay3mjzx2nqsq09s";
  };

})
