final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-01-31";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "785837cd565b38dcf80c6d1b8c9fde3c49b258b4";
    sha256 = "0y4c3ws8z5qrzz1wpzsgmid6i197djl5glrmva1pykydw9vnprbi";
  };

})
