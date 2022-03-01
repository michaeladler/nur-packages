final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-28";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "32d072282d30ca9f4a4b802a971f6d47cfadc94b";
    sha256 = "01xyqyg2nmfqh5z8gnfcvm79hd0sdzmd4pl3d5q4fdsdsb1zh797";
  };

})
