final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-16";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "a76ab81639f7d37bccb13a443907462d5dc92ecc";
    sha256 = "1720cvzcf8pr25q4mfnl8ls6pyh9i81yxawglkqs3m0rkqcmff0x";
  };

})
