final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-13";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "5ecb56e228bdb7404ea4df310572fb925fdcb834";
    sha256 = "1sklnjfh9zwnz1z0nrinjhkjxf6j7bkdgi9glg2jl4irf66jxrdk";
  };

})
