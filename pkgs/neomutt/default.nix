final: prev:

prev.neomutt.overrideAttrs (old: {
  version = "unstable-2022-02-18";

  patches = [ ./patches/0001-Update-polybar-when-mailbox-is-saved.patch ];

  src = prev.fetchFromGitHub {
    owner = "neomutt";
    repo = "neomutt";
    rev = "26fbd795c0f55782d016507cf33b047afd087b51";
    sha256 = "0p9nvx58fx2k2430gvfc6cssg1w7wi0i4bq406gyah5xibmkmwsk";
  };

})
