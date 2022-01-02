final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-01-01";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "1cabdee81c7d279b42b419c54942d32b374a2e79";
    sha256 = "11hqhah0m88pda7ci3lrlnr0l96sxh01l6s0rihvygxnfwp61a69";
  };

})
