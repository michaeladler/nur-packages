final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-11-21";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "41675aea4ec38d0d55df1489d15785e55c7de3e7";
    sha256 = "12473lfn5qg7fjrnmz9bkq1jgvzdzpyqp7g7z1rlzhj7hi2zq4c3";
  };

})
