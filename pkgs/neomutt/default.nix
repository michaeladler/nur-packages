final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-22";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "e94511135ee104cb5fce5642873bf55a893ae35c";
    sha256 = "1562bh90nrq6d941q8h0baids9wn9i3cidzh8hm16gvh3fyw3cal";
  };

})
