final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-01";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "741751d6f6bc48458152350110a1d7cecc81b9dd";
    sha256 = "087bf3c7p5dw25ql60ma0fv7w306z14zpmjnmxqh6rb79ad3r3wl";
  };

})
