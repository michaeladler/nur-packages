final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-03-08";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "d8ee8c5e5ce29d2e851418cd49f193d62e8dea76";
    sha256 = "1zi6s2iaz5a7h3qnr368gj06s82cdmh4wr737kcjdc5bhrrffpb8";
  };

})
