final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-10";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "f5e40b011b34d2fee26476984bf5c16c5f26be73";
    sha256 = "1q2zgvmfnlwmhyc55a30bz8ys59r5z371jdl69ias34pj4869gbj";
  };

})
