final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-05";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "d11162477831136c046832fa166869a9f6d0e8af";
    sha256 = "1rbli4phaf39rm3vrhdn2fqdnh079p8qdsjgsccs3i8hcrigyws9";
  };

})
