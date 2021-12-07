final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-06";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "607efc400c84ce4258db6b0a7a250ee604545b45";
    sha256 = "0l8maark17w8d4w5kyy15clj3k2wq7330kcffw26zgjri1nvw8rk";
  };

})
