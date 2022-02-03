final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-02";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "16ee9f648d98a6be3c0f30f71f0af37173476a7a";
    sha256 = "1k434pfddmbglsd2h1908akajyywmkhynwf08b7x1ds0b16qrfv2";
  };

})
