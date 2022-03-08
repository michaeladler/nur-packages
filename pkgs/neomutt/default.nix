final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-03-07";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "f9061c746c86ee4c0f5229bf9b4066262a61ba5b";
    sha256 = "0gby9zsaz3lvv1wdi3c2x5xs47mgy7fkmfbf8xnsijg1rrfllack";
  };

})
