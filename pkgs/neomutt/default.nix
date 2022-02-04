final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-04";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "d2e7be4e24b3c2423df7550f0ca4423d83476ade";
    sha256 = "0zlrb8bk7y9na7gx1ziavsfkd53amqggcpl71x3znr097j1mfm1x";
  };

})
