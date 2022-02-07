final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-07";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "7b0a2d5f2f6651722d11004467bf32a660a09501";
    sha256 = "00pwqqmyj6rpxgcwjv9dfpgyb2564vi95v0xgsi0i5g6za3w76jw";
  };

})
