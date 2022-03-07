final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-03-06";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "eab1520baca6dbf3b5260250d5e3fc186de256dd";
    sha256 = "0972vdm71yyr520g3xxz0zqqy09cjp9vq13hibh7ac4s0m0rz35s";
  };

})
