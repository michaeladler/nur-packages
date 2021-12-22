final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2021-12-22";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "088fa6459a7b1574de9f7f728f5f0dc545b24fcc";
    sha256 = "0yds33q88jxl68blzv5jkygyqhcdyj24632q1557b9mbxx53sazf";
  };

})
