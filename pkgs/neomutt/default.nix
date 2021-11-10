final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-09";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "b680fe03faa1ba318b56a8cce4fb5a2cd4e1aefc";
    sha256 = "0xdq9qpqpkrdkmasl4c82dj31gzdgfz73c5ms4zryjqh77jd1z23";
  };

})
