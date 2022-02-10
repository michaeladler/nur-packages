final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-09";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "033d7f1e0c7ac56088be86742225c5c85e0b3cc4";
    sha256 = "0hk2cv6zyjkiwqsm2qjjjk8jfriaspymb8lqhf0n9c3w2n4w0irg";
  };

})
